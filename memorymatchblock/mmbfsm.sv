`include "headercap_def.vh"

module mmbfsm (
	input clock,
	input reset,
	
	input [CONCAT_WIDTH-1:0] sort_dataout [15:0],
	input sort_dataout_valid [15:0],
	
	//input [CONCAT_WIDTH-1:0] rulemem [1:0] [511:0],
	input [CONCAT_WIDTH-1:0] tempmem [1:0] [15:0],
	input [CONCAT_WIDTH-1:0] rulein,
	output reg [CONCAT_WIDTH-1:0] ruleout,
	
	output reg [9:0] rulemergeidx,
	output reg [3:0] tempidx,
	
	input [9:0] rulecount,
	input [3:0] tempcount [1:0],
	
	output reg bigactive,
	output reg tempactive,
	output reg sortclear,
	output reg sortload,
	input sortready,
	//output reg writetemp,
	//output reg writebig,
	output reg write,
	
	input searchactive,
	output doswap
);
	localparam GS_IDLE = 0, GS_SORT = 1, GS_MERGE = 2;
	
	reg [2:0] state;
	reg [2:0] nextstate;
	
	reg donesort;
	reg donemerge;
	
	reg [CONCAT_WIDTH-1:0] membuffer;
	reg [CONCAT_WIDTH-1:0] tempbuffer;
	
	reg big_ntemp;
	
	assign doswap = donemerge && !searchactive;
	
	//--------------
	
	always@ (posedge clock)
		if (reset)	state <= GS_IDLE;
		else			state <= nextstate;
	
	always@* begin
		case (state)
			GS_IDLE: nextstate = (tempcount[tempactive] > 0) ?  GS_SORT : GS_IDLE;
			GS_SORT: nextstate = (donesort) ? GS_MERGE : GS_SORT;
			GS_MERGE: nextstate = (donemerge && !searchactive) ? GS_IDLE :GS_MERGE;
			default: nextstate = GS_IDLE;
		endcase
	end
	
	always@(posedge clock) begin
		if (reset) begin
			tempidx <= 0;
			rulemergeidx <= 0;
		end
		else begin
		if (state==GS_IDLE) tempidx <= 0;
		else if (state==GS_SORT) begin
			if (tempidx == tempcount[~tempactive] - 1 && sortready) 
				tempidx <= 0; //that's the last one - we need to reset
			else if (tempidx < tempcount[~tempactive] && sortready)
				tempidx <= tempidx + 1;
			if (nextstate==GS_MERGE)
				rulemergeidx <= 1;
			else
				rulemergeidx <= 0;
		end
		else if (state==GS_MERGE) begin
			/*if (!sort_dataout_valid[tempidx] && rulemergeidx == rulecount) ;
			else if (!sort_dataout_valid[tempidx] && rulemergeidx < rulecount) begin
				rulemergeidx <= rulemergeidx + 1;
			end
			else if (sort_dataout_valid[tempidx] && rulemergeidx == rulecount) begin
				tempidx <= tempidx + 1;
			end
			else if (sort_dataout[tempidx] < rulemem [~bigactive][rulemergeidx]) begin
				tempidx <= tempidx + 1;
			end
			else begin
				rulemergeidx <= rulemergeidx + 1;
			end
				*/
			if (!big_ntemp) tempidx <= tempidx + 1;
			else rulemergeidx <= rulemergeidx + 1;
			//if (writetemp) tempidx <= tempidx + 1;
			//else if (writebig) rulemergeidx <= rulemergeidx + 1;
		end
		end
	end
	
	always@(posedge clock) begin
		if (reset) begin
			tempactive <= 0;
			bigactive <= 0;
		end
		else begin
			if (tempcount[tempactive] > 0 && state == GS_IDLE)
				tempactive <= ~tempactive;
			if (donemerge && !searchactive)
				bigactive <= ~bigactive;
		end
	end
	
	always@(posedge clock)
		if ((big_ntemp && write) || state != GS_MERGE) membuffer <= rulein;
		//if (writebig || state != GS_MERGE) membuffer <= rulein;
	
	always@(posedge clock)
		if (state == GS_SORT) tempbuffer <= sort_dataout[0];
		else if (!big_ntemp && write) tempbuffer <= sort_dataout[tempidx+1];
		//else if (writetemp) tempbuffer <= sort_dataout[tempidx+1];
	
	always@* begin
		donesort = (state==GS_SORT)&&(tempidx == tempcount[~tempactive] - 1);
		donemerge = (!sort_dataout_valid[tempidx] && rulemergeidx > rulecount);
		//donemerge = (!sort_dataout_valid[tempidx] && rulemergeidx == rulecount);
		sortclear = (state == GS_IDLE);
		sortload = (state == GS_SORT);
		write = (state == GS_MERGE) && (sort_dataout_valid[tempidx] || rulemergeidx <= rulecount);
		//big_ntemp = (!sort_dataout_valid[tempidx]) || (tempbuffer >= membuffer);
		//writetemp = (state == GS_MERGE && sort_dataout_valid[tempidx] && 
		//	((rulemergeidx > rulecount) || (tempbuffer < membuffer)));
		//writebig = (state == GS_MERGE && (rulemergeidx <= rulecount) &&
		//	((!sort_dataout_valid[tempidx]) || (tempbuffer >= membuffer)));
		//ruleout = big_ntemp ? membuffer : tempbuffer;
		//ruleout = writebig ? membuffer : tempbuffer;
		//writetemp = (state == GS_MERGE && sort_dataout_valid[tempidx] && 
		//	((rulemergeidx == rulecount) || (sort_dataout[tempidx] < rulemem [bigactive][rulemergeidx])));
		//writebig = (state == GS_MERGE && (rulemergeidx < rulecount) &&
		//	((!sort_dataout_valid[tempidx]) || (sort_dataout[tempidx] >= rulemem [bigactive][rulemergeidx])));
	end
	
	always@(posedge clock) begin
		big_ntemp = (!sort_dataout_valid[tempidx]) || (tempbuffer >= membuffer);
		ruleout = big_ntemp ? membuffer : tempbuffer;
	end
	
endmodule 