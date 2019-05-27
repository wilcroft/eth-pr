`include "headercap_def.vh"
module linearsearch (
	input clock,
	input reset,
	input [CONCAT_WIDTH-1:0] tempmem [15:0],
	input [3:0] tempcount,
	
	input [CONCAT_WIDTH-1:0] concat,
	input concat_valid,
	output concat_ready,
	
	output reg matchactive,
	output reg matchfound,
	input matchack,
	input stop
);

	reg [CONCAT_WIDTH-1:0] tomatch;
	reg [3:0] idx;
	reg done, found;
	
	assign concat_ready = !matchactive && !matchfound;
	
	always@* begin
		found = tempmem[idx] == tomatch;
		done = matchactive && (stop || found || idx == tempcount-1);
	end
	
	always@(posedge clock) begin
		if (reset) begin
			matchactive <= 0;
		end 
		else if (concat_valid && !matchactive && !matchfound && tempcount>0 && !stop) begin
			tomatch <= concat;
			matchactive <= 1;
		end
		else if (done)
			matchactive <= 0;
		//else if (stop)
		//	matchactive <= 0;
	end
	
	always@(posedge clock) begin
		if (reset)
			idx <= 0;
		else if (!matchactive)
			idx <= 0;
		else 
			idx <= idx + 1;
	end
	
	always@(posedge clock) begin
		if (reset) matchfound <= 0;
		else if (matchactive && found) matchfound <= 1;
		else if (matchfound && matchack) matchfound <= 0;
	end	
	
endmodule