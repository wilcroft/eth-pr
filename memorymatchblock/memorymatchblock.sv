`include "headercap_def.vh"
 /* TODO LIST:
	- verify memory block changes
	- NEED SEPERATE MIF FILES FOR EACH MEMORY!!!!
*/
module memorymatchblock (
	input clock,
	input reset,
	input avs_update_write,
	input avs_update_read,
	input [31:0] avs_update_writedata,
	output reg [31:0] avs_update_readdata,
	input [0:0] avs_update_address,
	
	output reg [9:0] match_data_out,
	output reg match_data_valid,
	input match_data_ack,
	
	output reg pnode_ready,
	input [73:0]pnode_data,
	input pnode_valid
	
);
	// input/output signals
	wire [63:0] cap_data;
	wire cap_sop, cap_eop, cap_valid, cap_ready;
	
	wire fifo_empty;
	
	wire [CONCAT_WIDTH-1:0] concat;
	wire concat_valid, concat_ready;
	
	//wire match_flush;

	reg [7:0] tag_in;
	reg [7:0] tag_out;
	
	assign {cap_sop, cap_eop, cap_data} = pnode_data[65:0];
	//assign match_flush = z0_valid && !z0_out; 
	assign match_data_valid = !fifo_empty;
	
	assign pnode_ready = cap_ready;
	assign cap_valid = pnode_valid;
	
	always@(posedge clock) begin
		if (cap_eop)
			tag_in <= pnode_data [73-:8];
		if (concat_ready&&concat_valid)
			tag_out <= tag_in;
	end
	
	// Memory Signals
	
	//reg [CONCAT_WIDTH-1:0] rulemem [1:0] [511:0];
	wire [8:0] readaddr;
	reg [CONCAT_WIDTH-1:0] tempmem [1:0] [15:0];
	reg [9:0] rulecount;
	reg [9:0] writeidx;
	reg [3:0] tempcount [1:0];
	
	integer i;
	
	// Sorter Signals
	reg [CONCAT_WIDTH-1:0] sort_datain;
	reg sort_datain_valid;
	wire sortready;
	wire [CONCAT_WIDTH-1:0] sort_dataout [15:0];
	wire sort_dataout_valid [15:0];
	
	// FSM signals
	wire bigactive, tempactive, sortclear, sortload, searchactive, doswap;
	wire write;
	//wire writetemp, writebig,
	wire [9:0] rulemergeidx;
	wire [3:0] tempidx;
	wire [CONCAT_WIDTH-1:0] rulein;
	wire [CONCAT_WIDTH-1:0] ruleout;
	
	// Merge Signals
	
	wire [1:0] ls_concat_ready;
	wire [1:0] ls_matchactive;
	wire [1:0] ls_matchfound;
	wire bs_concat_ready;
	wire bs_matchactive;
	wire bs_matchfound;
	wire matchack;
	wire stop;
	wire match_concat_valid;
	
	// newrule signals
	wire [CONCAT_WIDTH-1:0] newrulein;
	wire newrulein_empty;
	wire newrulein_ack;

	// Rulemem signals
	wire [8:0] ruleaddr [1:0] [1:0]; //
	wire [CONCAT_WIDTH-1:0] rule_readdata [1:0][1:0]; 
	wire [CONCAT_WIDTH-1:0] rule_writedata;
	wire [1:0] rule_wren; //
	
	// ---
	
	assign concat_ready = ls_concat_ready[0] && ls_concat_ready[1] && bs_concat_ready;
	assign match_concat_valid = concat_ready && concat_valid;
	assign stop = ls_matchfound[0] || ls_matchfound[1] || bs_matchfound;
	assign matchack = stop;
	
	assign searchactive = ls_matchactive[0] || ls_matchactive[1] || bs_matchactive;
	
	assign newrulein_ack = !newrulein_empty;
	// Big Memory Storing
	
	/*always@(posedge clock) begin
		if (reset) begin
			for (i=0; i<512; i=i+1) begin
				rulemem[0][i] <= {CONCAT_WIDTH{1'b0}};
				rulemem[1][i] <= {CONCAT_WIDTH{1'b0}};
			end
			rulemem[0][7] <= 120'h0a000a00140014000800f5fb080001;
		end
		else begin
			if (writebig)
				rulemem[~bigactive][writeidx] <= rulemem[bigactive][rulemergeidx];
			else if (writetemp)
				rulemem[~bigactive][writeidx] <= sort_dataout[tempidx];
		end
	end	*/
	
	always@(posedge clock) begin
		if (reset) begin
			for (i=0; i<16; i=i+1) begin
				tempmem[0][i] <= {CONCAT_WIDTH{1'b0}};
				tempmem[1][i] <= {CONCAT_WIDTH{1'b0}};
			end
		end
		else if (!newrulein_empty)
			tempmem[tempactive][tempcount[tempactive]] <= newrulein;
	end
				
	
	always@(posedge clock) begin
		if (reset) begin
			tempcount[0] <= 0;
			tempcount[1] <= 0;
			rulecount <= 8;//0;
		end
		else begin
			if (doswap) begin
				rulecount <= writeidx;
				tempcount[~tempactive] <= 0;
			end
			if (!newrulein_empty)
				tempcount[tempactive] <= tempcount[tempactive] + 1;
		end
	end
	
	always@(posedge clock)
		if (reset || sortclear) writeidx <= 0;
		else if (write) writeidx <= writeidx + 1;
		//else if (writebig || writetemp) writeidx <= writeidx + 1;
		
	/*always@* begin
		sort_datain = tempmem[~tempactive][tempidx];
		sort_datain_valid = sortload;
	end*/
	always@(posedge clock)begin
		sort_datain = tempmem[~tempactive][tempidx];
		sort_datain_valid = sortload;
	end
	
	// Submodules
	header_capture headercap (
		.clk(clock),
		.avalon_st_rx_sop (cap_sop),
		.avalon_st_rx_valid(cap_valid),
		.avalon_st_rx_data(cap_data),
		.avalon_st_rx_empty(),
		.avalon_st_rx_error(),                 
		.avalon_st_rx_eop(cap_eop),
		.avalon_st_rx_ready(cap_ready),
		.concat,
		.concat_valid,
		.concat_ready
	);
	
	mmbfsm FSM (.*);
	
	binarysearch BinS (
		.clock,
		.reset,
		//.rulemem,
		.rulecount,
		.rulefrommem(rule_readdata[bigactive][1]),
		.readaddr,
		.bigactive,
		.concat,
		.concat_valid(match_concat_valid),
		.concat_ready(bs_concat_ready),
		.matchactive(bs_matchactive),
		.matchfound(bs_matchfound),
		.matchack,
		.stop);
	
	linearsearch LinS0 (
		.clock,
		.reset,
		.tempmem(tempmem[0]),
		.tempcount(tempcount[0]),
		.concat,
		.concat_valid(match_concat_valid),
		.concat_ready(ls_concat_ready[0]),
		.matchactive(ls_matchactive[0]),
		.matchfound(ls_matchfound[0]),
		.matchack,
		.stop
	);
	linearsearch LinS1 (
		.clock,
		.reset,
		.tempmem(tempmem[1]),
		.tempcount(tempcount[1]),
		.concat,
		.concat_valid(match_concat_valid),
		.concat_ready(ls_concat_ready[1]),
		.matchactive(ls_matchactive[1]),
		.matchfound(ls_matchfound[1]),
		.matchack,
		.stop
	);

	sorterblock #(.size(CONCAT_WIDTH), .blockcount(16)) sorter (
		.clock,
		.reset (reset | sortclear),
		.datain(sort_datain),
		.datain_valid(sort_datain_valid),
		.datain_ready(sortready),
		.dataout(sort_dataout),
		.dataout_valid(sort_dataout_valid)
	);
	
	
	hardblockfifo matchfifo (
		.clock,
		.data({tag_out[7:6],tag_out}),
		.rdreq(match_data_ack),
		.wrreq(matchack),
		.empty(fifo_empty),
		.q(match_data_out)
	);
	
	newrulefifo #(.CONCAT_WIDTH(CONCAT_WIDTH)) NRF (
		.clock,
		.reset,
		.data(avs_update_writedata),
		.q(newrulein),
		.wrreq(avs_update_write),
		.rdack(newrulein_ack),
		.empty(newrulein_empty)
	);
	
	assign rule_wren[0] = (write) && bigactive;
	assign rule_wren[1] = (write) && ~bigactive;
	//assign rule_wren[0] = (writebig||writetemp) && bigactive;
	//assign rule_wren[1] = (writebig||writetemp) && ~bigactive;
	assign ruleaddr[0][0] = rule_wren[0] ? writeidx : rulemergeidx;
	assign ruleaddr[1][0] = rule_wren[1] ? writeidx : rulemergeidx;
	assign ruleaddr[0][1] = readaddr;
	assign ruleaddr[1][1] = readaddr;
	assign rule_writedata = ruleout;
	
	//assign rulefrommem = rule_readdata[bigactive][1];
	assign rulein = rule_readdata[bigactive][0];

	rulemem #(.WIDTH(CONCAT_WIDTH)) MEM0 (
		.clock,
		.address_a(ruleaddr[0][0]),
		.address_b(ruleaddr[0][1]),
		.data_a(rule_writedata),
		.data_b({CONCAT_WIDTH{1'b0}}),
		.wren_a(rule_wren[0]),
		.wren_b(1'b0),
		.q_a(rule_readdata[0][0]),
		.q_b(rule_readdata[0][1])
	);
	rulemem #(.WIDTH(CONCAT_WIDTH)) MEM1 (
		.clock,
		.address_a(ruleaddr[1][0]),
		.address_b(ruleaddr[1][1]),
		.data_a(rule_writedata),
		.data_b({CONCAT_WIDTH{1'b0}}),
		.wren_a(rule_wren[1]),
		.wren_b(1'b0),
		.q_a(rule_readdata[1][0]),
		.q_b(rule_readdata[1][1])
	);
	// State Machine Logic
	
//	always@ (posedge clock)
//		if (reset)	GS_reg <= GS_IDLE;
//		else			GS_reg <= GS_next;
	
//	always@* begin
//		case (GS_reg)
//			GS_IDLE: GS_next = (tempcount[tempactive] > 0) ?  GS_SORT : GS_IDLE;
//			GS_SORT: GS_next = (donesort) ? GS_MERGE : GS_SORT;
//			GS_MERGE: GS_next = (donemerge) ? GS_IDLE :GS_MERGE;
//			default: GS_next = GS_IDLE;
//		endcase
//	end
	
//	always@(posedge clock)
//		if (reset) tempactive <= 0;
//		else if (tempcount[tempactive] > 0 && GS_reg == GS_IDLE) tempactive <= ~tempactive;
		
//	always@(posedge clock)
//		if (reset) bigactive <=0;
//		else if (donemerge && GS_reg == GS_MERGE) bigactive <= ~bigactive;

	// Sort Logic
	
//	always@(posedge clock) begin
//		if (reset)
//			sortcount <= 0;
	//During Sort Phase
	
	//During Merge Phase
//		else if (GS_reg == GS_merge && bigcount[~tempactive]==sortcount)
//			sortcount <= sortcount + 1;
//		else if (GS_reg == GS_merge && sort_dataout[sortcount] <= rulemem[~bigactive][mergecount] && sort_data_valid[sortcount])
//			sortcount <= sortcount + 1;
//	end
	
	// Merge Logic
	
//	always@(posedge clock) begin
//		if (reset)
//			mergecount <= 0;
//		else if (GS_reg == GS_merge && tempcount[~tempactive]==sortcount)
//			mergecount <= mergecount + 1;
//		else if (GS_reg == GS__merge && sort_dataout[sortcount] > rulemem[~bigactive][mergecount] && mergecount < rulecount)
//			mergecount <= mergecount + 1;
//	end

endmodule
