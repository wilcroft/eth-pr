`timescale 100ps/100ps
`define clk 32
`define clkh 16
module eth4to1sim_tb ();

	reg clock;
	reg reset;
	reg [63:0] instream_data;
	reg instream_valid;
	reg instream_sop;
	reg instream_eop;
	wire instream_ready;
	
	wire [63:0] sendstream_data;
	wire sendstream_valid;
	wire sendstream_sop;
	wire sendstream_eop;
	wire [1:0] sendstream_channel;
	reg sendstream_ready;

 eth4to1sim dut (.*);
 
	initial begin
		clock = 0;
		reset = 1;
		forever begin
			#`clkh clock = ~clock;
			reset = 0;
		end
	end
	
	initial begin
		instream_sop = 0;
		instream_eop = 0;
		instream_valid = 0;
		instream_data = 0;
		sendstream_ready = 0;
		#(4*`clk) instream_sop = 1;
		instream_valid = 1;
		instream_data = 'h00169c7cb000000e;
		sendstream_ready = 1;
		while (!sendstream_ready) #`clk ;
		#`clk instream_sop = 0;
		instream_data = 'h39e3340008004500;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h002855f140007906;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'hde8c9c1226aeccf4;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h3d9d1e7e0050876d;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'ha4156ca874dc5010;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h0d02a9aa00000000;
		instream_eop = 1;
		while (!sendstream_ready) #`clk ;
		#`clk instream_eop = 0;
		#`clk instream_sop = 1;
		instream_valid = 1;
		instream_data = 'h00169c7cb000000e;
		sendstream_ready = 1;
		while (!sendstream_ready) #`clk ;
		#`clk instream_sop = 0;
		instream_data = 'h39e3340008004500;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h002855f140007906;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'hde8c9c1226aeccf4;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h3d9d1e7e0050876d;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'ha4156ca874dc5010;
		while (!sendstream_ready) #`clk ;
		#`clk instream_data = 'h0d02a9aa00000000;
		instream_eop = 1;
		while (!sendstream_ready) #`clk ;
		#`clk instream_eop = 0;
		instream_data = 'h00000000;
		instream_valid = 1;
		#`clk instream_valid = 0;
	end
	
	always@* if (sendstream_valid == 1) $stop;
	
 
endmodule
