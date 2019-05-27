`timescale 1ns/1ps

module match_network_tb();

localparam ncount = 8;

wire global_freeze;
wire [7:0] local_enable, local_freeze;

assign global_freeze = 0;
assign local_enable = 1;
assign local_freeze = 0;

reg clock, reset;

reg [127:0] stream_data;
reg stream_valid, stream_sop, stream_eop;
reg [7:0] stream_channel;
wire stream_ready;

wire [9:0] tag_data;
wire tag_valid;
reg tag_ready;

wire pnode_ready [ncount-1:0];
wire pnode_valid [ncount-1:0];
wire [137:0] pnode_data [ncount-1:0];

wire [9:0] pnodeout [ncount-1:0];
wire pnodeout_valid [ncount-1:0];
wire pnodeout_ack [ncount-1:0];

in_fifo_network #(.ncount(ncount)) innet (
	.clock,
	.sclr(!reset),
	.st_data(stream_data),
	.st_sop(stream_sop),
	.st_eop(stream_eop),
	.st_ready(stream_ready),
	.st_valid(stream_valid),
	.st_channel(stream_channel),
	.*
);
	
	out_fifo_network  #(.ncount(ncount)) outnet  (
			.clock,
			.sclr(!reset),
			.tag_data(tag_data),
			.tag_valid(tag_valid),
			.tag_ready(tag_ready),
			.dataout(pnodeout),
			.data_valid(pnodeout_valid),
			.data_ack(pnodeout_ack)
	);

	genvar i;
	
	generate 
		for (i=0; i< ncount; i=i+1) begin : pnode_gen
			matchblock_wrapper #(.blocktype(1)) mb (
				.clock,
				.reset,
				.mask_data_out(pnodeout[i]),
				.mask_data_valid(pnodeout_valid[i]),
				.mask_data_ack(pnodeout_ack[i]),
				.mask_pnode_ready(pnode_ready[i]),
				.mask_pnode_data(pnode_data[i]),
				.mask_pnode_valid(pnode_valid[i]),
				.coe_localfreeze(local_freeze[i]),
				.coe_enable(local_enable[i]),
				.coe_globalfreeze(global_freeze)
			);
		end
	endgenerate
	
	initial begin
	clock = 0;
	forever #5 clock = !clock;
	end
	
	initial begin
	reset = 0;
	tag_ready = 0;
	#10 reset = 1;
	tag_ready = 1;
	end
	
	initial begin
	stream_data = 0;
	stream_valid = 0;
	stream_sop = 0;
	stream_eop = 0;
	stream_channel = 5;
	#20
	stream_sop = 1;
	stream_valid = 1;
	stream_data = 'h004e46324302004e4632430208004500;
	#10 stream_valid = 0;
	#20 stream_sop = 0;
	stream_valid = 1;
	stream_data = 'h005C0000400040011F9B0A0203020A01;
	#10 stream_valid = 0;
	#20 stream_valid = 1;
	stream_data = 'h04020800D0C4B63D000F92D3B04C55DA;
	#10 
	stream_data = 'h000008090A0B0C0D0E0F101112131415;
	#10 
	stream_data = 'h161718191A1B1C1D1E1F202122232425;
	#10 
	stream_data = 'h262728292A2B2C2D2E2F303132333435;
	#10 stream_eop = 1;
	stream_data = 'h363738393A3B3C3D3E3F957C090BFD07;
	#10 stream_valid = 0;
	
	end
	
	
endmodule 