`include headercap_def.vh

module memory_match (
	input clock,
	input reset,
	
	//header interface
	input [CONCAT_WIDTH-1:0] head,
	input head_valid,
	output head_ready,
	
	//output 
	output [2:0] match,
	output match_valid,
	input match_ready,
	
	//new rules
	input [CONCAT_WIDTH+MASK_WIDTH-1:0] newrule,
	input newrule_valid,
	output newrule_ready

	);

reg []

endmodule
