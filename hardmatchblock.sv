`include "headercap_def.vh"
module hardmatchblock #(parameter CHOUT=0)(
	input clock,
	
	output reg [9:0] data_out,
	output data_valid,
	input data_ack,
	output pnode_ready,
	input [73:0]pnode_data,
	input pnode_valid
	);
	
	wire [63:0] cap_data;
	wire cap_sop, cap_eop, cap_valid, cap_ready;
	
	wire [CONCAT_WIDTH-1:0] concat;
	wire concat_valid, concat_ready;
	
	wire z0_out, z0_valid;
	wire match_flush = z0_valid && !z0_out;

	reg [7:0] tag_in;
	reg [7:0] tag_out;
	
	assign {cap_sop, cap_eop, cap_data} = pnode_data[65:0];
	assign data_valid = z0_valid &&z0_out;
	
	//assign data_out = tag_out;
	
	/// TEMPORARY CHANGE UNTIL DESIRED DEST ADDED TO BPF RULE
	assign data_out = {tag_out[7:6],tag_out};
	/// END TEMP CHANGE
	assign pnode_ready = cap_ready;
	assign cap_valid = pnode_valid;
	
	always@(posedge clock) begin
		if (cap_eop)
			tag_in <= pnode_data [73-:8];
		if (concat_ready&&concat_valid)
			tag_out <= tag_in;
	end
		
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
	
	allrules match (
		.xin(concat), 
		.xin_valid(concat_valid), 
		.clock(clock), 
		.z0_reg(z0_out), 
		.z0_valid(z0_valid),
		.z0_ready(data_ack||match_flush),
		.xin_ready(concat_ready)
	);
	
endmodule
