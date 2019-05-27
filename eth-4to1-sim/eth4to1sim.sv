module eth4to1sim(
	input clock,
	input reset,
	input [63:0] instream_data,
	input instream_valid,
	input instream_sop,
	input instream_eop,
	output instream_ready, //y
	
	output [63:0] sendstream_data,
	output reg sendstream_valid,
	output reg sendstream_sop,
	output reg sendstream_eop,
	output reg [1:0] sendstream_channel,
	input sendstream_ready
);
	parameter ncount = 4;
	
	wire [63:0] outstream_data;
	wire outstream_valid;
	wire outstream_sop;
	wire outstream_eop;
	wire [5:0] outstream_channel;
	wire outstream_ready;
	
	wire [7:0] tagstream_data;
	wire tagstream_valid;
	wire tagstream_ready;
	
	packetstorage ps(.*);
	
	wire pnode_ready [ncount-1:0];
	wire [71:0]pnode_data [ncount-1:0];
	wire pnode_valid [ncount-1:0];

	wire [7:0] pnodeout [ncount-1:0];
	wire pnodeout_valid [ncount-1:0];
	wire pnodeout_ack [ncount-1:0];
	
	wire clk312;
	assign clk312 = clock;
	
	in_fifo_network #(.ncount(ncount)) innet (
			.clock(clk312),
			.sclr(reset),
			.st_data(outstream_data),
			.st_sop(outstream_sop),
			.st_eop(outstream_eop),
			.st_valid(outstream_valid),
			.st_ready(outstream_ready),
			.st_channel(outstream_channel),
			.pnode_ready,
			.pnode_data,
			.pnode_valid
	);
	
	out_fifo_network  #(.ncount(ncount)) outnet  (
			.clock(clk312),
			.sclr(reset),
			.tag_data(tagstream_data),
			.tag_valid(tagstream_valid),
			.tag_ready(tagstream_ready),
			.dataout(pnodeout) ,
			.data_valid(pnodeout_valid),
			.data_ack(pnodeout_ack)
	);
	
	genvar i;
	
	generate 
		for (i=0; i< ncount; i=i+1) begin : pnode_gen
			hardmatchblock #(.CHOUT(i)) mb (
				.clock(clk312),
				.data_out(pnodeout[i]),
				.data_valid(pnodeout_valid[i]),
				.data_ack(pnodeout_ack[i]),
				.pnode_ready(pnode_ready[i]),
				.pnode_data(pnode_data[i]),
				.pnode_valid(pnode_valid[i])
			);
		end
	endgenerate

endmodule
