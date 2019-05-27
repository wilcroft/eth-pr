`timescale 1ns/1ns
module empty_test_tb();
	reg clock;
	reg reset;
	
	reg [63:0] packetin_data [3:0];
	reg packetin_valid [3:0];
	reg packetin_sop [3:0];
	reg packetin_eop [3:0];
	reg [2:0] packetin_empty [3:0];
	wire packetin_ready [3:0];
		
	wire [63:0] packetout_data [3:0];
	wire packetout_valid [3:0];
	wire packetout_sop [3:0];
	wire packetout_eop [3:0];
	reg packetout_ready [3:0];
	wire [5:0] packetout_channel [3:0];
		
	wire [63:0] transmitout_data [3:0];
	wire transmitout_valid [3:0];
	wire transmitout_sop [3:0];
	wire transmitout_eop [3:0];
	wire [2:0] transmitout_empty [3:0];
	reg transmitout_ready [3:0];
		
	reg [9:0] tagin_data;
	reg tagin_valid;
	wire tagin_ready;
	
	pmem_group DUT (.*);
	
	initial begin
		clock = 0;
		forever #5 clock = ~clock;
	end

	integer x;

	initial
		for (x=1;x<4;x=x+1) begin
			packetin_valid[x] = 0;
			packetin_data[x] = 0;
			packetin_sop[x] = 0;
			packetin_eop[x] = 0;
			packetin_empty[x] = 0;
			packetout_ready[x] = 0;
			transmitout_ready[3-x] = 0;
	end

	initial begin
		reset = 1;
		tagin_data = 0;
		tagin_valid = 0;
		for (x=0; x<4;x=x+1) begin
			packetin_sop[0] = 0;
			packetin_eop[0] = 0;
			packetin_valid[0] = 0;
			packetin_empty[0] = 0;
			packetout_ready[0] = 0;
			transmitout_ready[3] = 1;
		end
		#10 reset = 0;
			packetin_data[0]= 'h 004e46324302004e;
			packetout_ready[0] = 1;
			packetin_valid[0] = 1;
			packetin_sop[0] = 1;
		#10 
			packetin_sop[0] = 0;
			packetin_data[0]='h 4632430208004500;
		#10 packetin_data[0]='h 005C000040004001;
		#10 packetin_data[0]='h 1F9B0A0203020A01;
		#10 packetin_data[0]='h 04020800D0C4B63D;
		#10 packetin_data[0]='h 000F92D3B04C55DA;
		#10 packetin_data[0]='h 000008090A0B0C0D;
		#10 packetin_data[0]='h 0E0F101112131415;
		#10 packetin_data[0]='h 161718191A1B1C1D;
		#10 packetin_data[0]='h 1E1F202122232425;
		#10 packetin_data[0]='h 262728292A2B2C2D;
		#10 packetin_data[0]='h 2E2F303132333435;
		#10 packetin_data[0]='h 363738393A3B3C3D;
		#10 packetin_data[0]='h 3E3F957C090BFD07;
			packetin_empty[0] = 6;
			packetin_eop[0] = 1;
		#10
			packetin_eop[0] = 0;
			packetin_valid[0] = 0;
		#40
			tagin_valid = 1;
			tagin_data = 10'b1100000000;
		#10
			tagin_valid = 0;
			tagin_data = 0;
		#20 ;			
	end


	always @(posedge clock)
		for (x=0; x<4; x=x+1) begin
			if (packetin_valid[x] && packetin_ready[x]) begin
				if (packetin_sop[x]) $display("Start Send on %d", x);
				$display("Sent %x on %d", packetin_data[x], x);
				if (packetin_eop[x]) $display("End Send on %d", x);
			end
			if (transmitout_valid[x] && transmitout_ready[x]) begin
				if (transmitout_sop[x]) $display("Start Get on %d", x);
				$display("Recieved %x on %d", transmitout_data[x], x);
				if (transmitout_eop[x]) $display("End Get on %d", x);
			end
		end
	
endmodule