`include "headercap_def.vh"

module binarysearch (
	input clock,
	input reset,
	//input [CONCAT_WIDTH-1:0] rulemem [1:0] [511:0],
	input [CONCAT_WIDTH-1:0] rulefrommem,
	output [8:0] readaddr,
	input [9:0] rulecount,
	input bigactive,
	
	input [CONCAT_WIDTH-1:0] concat,
	input concat_valid,
	output concat_ready,
	
	output reg matchactive,
	output reg matchfound,
	input matchack,
	
	input stop
);
	reg [CONCAT_WIDTH-1:0] tomatch;
	reg [9:0] lb;
	reg [9:0] ub;
	reg [9:0] mid;
	
	reg done;
	reg memvalid;
	
	assign concat_ready = !matchactive && !matchfound;
	assign readaddr = mid;
	
	always@(posedge clock)
		if(!matchactive) memvalid <= 0;
		else memvalid <= 1;
	
	always@(posedge clock) begin
		if (reset) begin
			matchactive <= 0;
		end 
		else if (concat_valid && !matchactive && !matchfound && rulecount>0 && !stop) begin
			tomatch <= concat;
			matchactive <= 1;
		end
		else if (done)
			matchactive <= 0;
	end
	
	always@* begin
		//mid = ub[9:1] + lb[9:1];
		mid = lb + (ub[9:1] - lb[9:1]);
		done = matchactive && ((rulefrommem == tomatch && memvalid) || lb >= ub || stop);
		//done = matchactive && (rulemem[bigactive][mid] == tomatch || lb >= ub || stop);
	end
	
	always@(posedge clock) begin
		if (reset) begin
			ub <= 0;
			lb <= 0;
		end
		else if (concat_valid && !matchactive) begin
			lb <= 0;
			ub <= rulecount-1;
		end
		else if (memvalid) begin//(matchactive) begin
			if (tomatch < rulefrommem)
			//if (tomatch < rulemem[bigactive][mid])
				ub <= mid-1;
			else if (tomatch > rulefrommem)
			//else if (tomatch > rulemem[bigactive][mid])
				lb <= mid+1;
		end
	end
	
	always@(posedge clock) begin
		if (reset) matchfound <= 0;
		else if (memvalid && rulefrommem == tomatch) matchfound <= 1;
		//else if (matchactive && rulemem[bigactive][mid] == tomatch) matchfound <= 1;
		else if (matchfound && matchack) matchfound <= 0;
	end

endmodule
