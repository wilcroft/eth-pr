`timescale 1ns/1ns
module pmem_group_tb();
	reg clock;
	reg reset;
	
	reg [63:0] packetin_data [3:0];
	reg packetin_valid [3:0];
	reg packetin_sop [3:0];
	reg packetin_eop [3:0];
	wire packetin_ready [3:0];
	reg [2:0] packetin_empty [3:0];
		
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
	wire [2:0] transmitout_empty [3:0];
		
	reg [9:0] tagin_data;
	reg tagin_valid;
	wire tagin_ready;
	
	pmem_group DUT (.*);
	
	initial begin
		clock = 0;
		forever #5 clock = ~clock;
	end

	integer x;

	always @(negedge clock)
		for (x=0;x<4;x=x+1)
			packetin_data[x] = {$random,$random};

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
			packetin_empty[x] = 0;
		end
		#10 reset = 0;
		for (x=0; x<4;x=x+1)begin
		//	packetin_data[x]=x;
			packetout_ready[x] = 1;
		end
			packetin_valid[3] = 1;
			packetin_sop[3] = 1;
		#10 
			packetin_sop[3] = 0;
		#30
			packetin_eop[3] = 1;
			packetin_empty[3] = 5;
		#10
			packetin_eop[3] = 0;
			packetin_valid[3] = 0;
			packetin_empty[3] = 0;
		#40
			tagin_valid = 1;
			tagin_data = 10'b1011000000;
		#20
			tagin_valid = 0;
			tagin_data = 0;
		#20 ;	
		for (x=0;x<8;x=x+1)
			#10 transmitout_ready[2]=$random;//~transmitout_ready[2];
			
			
		
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
