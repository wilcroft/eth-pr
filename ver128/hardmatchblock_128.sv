`include "headercap_def.vh"
module hardmatchblock_128 #(parameter CHOUT=0)(
	input clock,
	
	output reg [9:0] data_out,
	output data_valid,
	input data_ack,
	output pnode_ready,
	input [137:0]pnode_data,
	input pnode_valid
	);
	
	wire [127:0] cap_data;
	wire cap_sop, cap_eop, cap_valid, cap_ready;
	
	wire fifo_empty, fifo_full;
	
	wire [CONCAT_WIDTH-1:0] concat;
	wire [CONCAT_WIDTH-1+8:0] concat_out;
	wire concat_valid, concat_ready, concat_rdreq;
	wire concat_full, concat_empty, concat_almost;
	
	wire z0_out, z0_valid;
	wire match_flush;

	reg [7:0] tag_capture;
	

	reg [7:0] tag_in;
	reg [7:0] tag_out;
	
	assign {cap_sop, cap_eop, cap_data} = pnode_data[129:0];
	assign match_flush = z0_valid && !z0_out;
//	assign data_valid = z0_valid &&z0_out;
	assign data_valid = !fifo_empty;
	
	assign concat_ready = !concat_almost;
	
	//assign data_out = tag_out;
	
	/// TEMPORARY CHANGE UNTIL DESIRED DEST ADDED TO BPF RULE
	//assign data_out = {tag_out[7:6],tag_out};
	/// END TEMP CHANGE
	//assign pnode_ready = cap_ready;
	assign pnode_ready = !concat_almost;
	assign cap_valid = pnode_valid;
	
	always@(posedge clock) begin
		if (cap_valid && cap_eop)
			tag_capture <= pnode_data [137-:8];
		if (concat_rdreq&&!concat_empty)
			tag_in <= concat_out [CONCAT_WIDTH +: 8];
		if ((!fifo_full)||~z0_valid)
			tag_out <= tag_in;
	end
		
	header_capture_128 headercap (
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
	
	scfifo concatfifo (
		.clock(clock),
		.data({tag_capture,concat}),
		.rdreq(concat_rdreq&&!concat_empty),
		.wrreq(concat_valid&&!concat_full),
		.empty(concat_empty),
		.full(concat_full),
		.almost_full(concat_almost),
		.q(concat_out)
	);
	defparam concatfifo.add_ram_output_register = "OFF",
		concatfifo.lpm_width = CONCAT_WIDTH+8,
		concatfifo.lpm_widthu = 4,
		concatfifo.lpm_numwords = 16,
		concatfifo.almost_full_value = 14,
		concatfifo.lpm_showahead = "ON";
	
	allrules match (
		.xin(concat_out[0+:CONCAT_WIDTH]), 
		.xin_valid(!concat_empty), 
		.clock(clock), 
		.z0_reg(z0_out), 
		.z0_valid(z0_valid),
		//.z0_ready(data_ack||match_flush),
		.z0_ready(!fifo_full),
		.xin_ready(concat_rdreq)
	);
	
	hardblockfifo matchfifo (
		.clock,
		.data({tag_out[7:6],tag_out}),
		.rdreq(data_ack),
		.wrreq(z0_valid & z0_out & !fifo_full),
		.empty(fifo_empty),
		.full(fifo_full),
		.q(data_out)
	);
	
endmodule
