`timescale 1ns/1ns
module pmem_group_tb();
	reg clock;
	reg reset;
	
	reg [63:0] packetin_data [3:0];
	reg packetin_valid [3:0];
	reg packetin_sop [3:0];
	reg packetin_eop [3:0];
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
	initial begin
		reset = 1;
		tagin_data = 0;
		tagin_valid = 0;
		for (x=0; x<4;x=x+1) begin
			packetin_sop[x] = 0;
			packetin_eop[x] = 0;
			packetin_valid[x]=0;
			packetout_ready[x] = 0;
			transmitout_ready[x] = 1;
		end
		#10 reset = 0;
		for (x=0; x<4;x=x+1)begin
			packetin_data[x]=x;
			packetout_ready[x] = 1;
		end
			packetin_valid[3] = 1;
			packetin_sop[3] = 1;
		#10 
			packetin_sop[3] = 0;
		#20
			packetin_eop[3] = 1;
		#10
			packetin_eop[3] = 0;
			packetin_valid[3] = 0;
		#40
			tagin_valid = 1;
			tagin_data = 10'b1110000000;
		#20
			tagin_valid = 0;
			tagin_data = 0;
		#20 ;	
		for (x=0;x<8;x=x+1)
			#10 transmitout_ready[2]=~transmitout_ready[2];
			
			
		
	end
	
endmodule
