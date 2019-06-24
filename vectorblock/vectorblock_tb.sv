`timescale 1ns/1ps
module vectorblock_tb();

	reg clock;
	reg reset;
	
	reg avs_update_write;
	reg [31:0] avs_update_writedata;
	reg [0:0] avs_update_address;
	
	wire [13:0] match_data_out;
	wire match_data_valid;
	reg match_data_ack;
	
	wire pnode_ready; 
	reg [141:0] pnode_data; // tag, sop, eop, data
	reg pnode_valid;

	reg [127:0] data;
	reg sop, eop;
	reg [11:0] tag;
	
	vectormatchblock_128 DUT (.*);
	
	initial begin
		clock = 0;
		forever #5 clock = ~clock;
	end
	
	initial begin
		reset = 1;
		avs_update_write = 0;
		match_data_ack = 0;
		pnode_valid = 0;
		#20
		reset = 0;
		#10 
		pnode_valid = 1;
		tag = 7;
		sop = 1;
		eop = 0;
		data = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
		#10 sop = 0;
		#60 eop = 1;
		#10 eop = 0;
		pnode_valid = 0;
		#10 pnode_valid = 1;
		tag = 12;
		sop = 1;
		data = 128'd0;
		#10 sop = 0;
		#60 eop = 1;
		#10 eop = 0;
		pnode_valid = 0;
		#10 pnode_valid = 1;
		sop = 1;
		tag = 17;
		data = 128'h55555555555555555555555555555555;
		#10 sop = 0;
		#60 eop = 1;
		#10 eop = 0;
		pnode_valid = 0;
		#10 pnode_valid = 1;
		sop = 1;
		tag = 43;
		data = 128'h12153523c0895e818484d609b1f05663;
		#10 sop = 0;
		#60 eop = 1;
		#10 eop = 0;
		pnode_valid = 0;
		
	end

	always@* begin
		pnode_data = {tag, sop, eop, data};
		match_data_ack = match_data_valid;
	end
	
endmodule