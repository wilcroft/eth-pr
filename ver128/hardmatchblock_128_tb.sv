`timescale 1ns/1ps
module matchtb();

reg clock;
reg [137:0] pnode_data;
wire pnode_valid;
reg data_ack;
reg [3:0] ran;

wire pnode_ready;
wire data_valid;
wire [9:0] data_out;

hardmatchblock_128 dut (.*);

assign pnode_valid = 1;

initial begin
	clock = 0;
	forever #5 clock = ~clock;
end

reg [31:0] incount;
reg [31:0] outcount;

initial begin
	incount = 0;
	outcount = 0;
	data_ack = 0;
	pnode_data[127:125] = 0;
	pnode_data[137:130] = 0;
end

always@(posedge clock) begin
	if (pnode_ready & pnode_valid & pnode_data[128])
		incount <= incount + 1;
	if (data_valid & data_ack)
		outcount <= outcount + 1;
end

always@* begin
	pnode_data[124:0] = 0;
	data_ack = &ran & data_valid;
	pnode_data[128] = pnode_data[127:125] == 5;
	pnode_data[129] = pnode_data[127:125] == 0;
end
	
always@(posedge clock) begin
	ran <= $random;
	if (pnode_data[128] & pnode_ready & pnode_valid) begin
		pnode_data[127:125] <= 0;
		pnode_data[137:130] <= pnode_data[137:130] + 1;
	end
	else if (pnode_ready & pnode_valid) 
		pnode_data[127:125] <= pnode_data[127:125] + 1;
end

always@(posedge clock)
	if ({outcount[7:6],outcount[7:0]} != data_out)
		$stop;
always@(posedge clock)
	if (outcount >= 10000)
		$stop;

endmodule