`timescale 1ns/1ns
module whole_system_tb();
	localparam ncount = 8;

	wire global_freeze;
	wire [7:0] local_enable, local_freeze;
	wire xoff;

	assign global_freeze = 0;
	assign local_enable = 1;
	assign local_freeze = 0;

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
	wire packetout_ready [3:0];
	wire [9:0] packetout_channel [3:0];
	
	wire [127:0] doubleout_data [3:0];
	wire doubleout_valid [3:0];
	wire doubleout_sop [3:0];
	wire doubleout_eop [3:0];
	wire doubleout_ready [3:0];
	wire [9:0] doubleout_channel [3:0];
		
	wire [63:0] transmitout_data [3:0];
	wire transmitout_valid [3:0];
	wire transmitout_sop [3:0];
	wire transmitout_eop [3:0];
	reg transmitout_ready [3:0];
	wire [2:0] transmitout_empty [3:0];
		
	wire [9:0] tagin_data;
	wire tagin_valid;
	wire tagin_ready;
	
	wire [127:0] stream_data;
	wire stream_valid, stream_sop, stream_eop;
	wire [11:0] stream_channel;
	wire stream_ready;
	
	wire pnode_ready [ncount-1:0];
	wire pnode_valid [ncount-1:0];
	wire [137:0] pnode_data [ncount-1:0];

	wire [9:0] pnodeout [ncount-1:0];
	wire pnodeout_valid [ncount-1:0];
	wire pnodeout_ack [ncount-1:0];

	
	genvar i;
	
	pmem_group_v2 DUT (.reset(!reset), .*);

	generate 
		for (i=0; i<4; i=i+1) begin:doubles
		eth4to1_doublewidth0 dbl(
			.in_ready(packetout_ready[i]),
			.in_valid(packetout_valid[i]),
			.in_data(packetout_data[i]),
			.in_channel(packetout_channel[i]),
			.in_startofpacket(packetout_sop[i]),
			.in_endofpacket(packetout_eop[i]),
			.in_empty(3'b0),
			.out_ready(doubleout_ready[i]),
			.out_valid(doubleout_valid[i]),
			.out_data(doubleout_data[i]),
			.out_channel(doubleout_channel[i]),
			.out_startofpacket(doubleout_sop[i]),
			.out_endofpacket(doubleout_eop[i]),
			.out_empty(),
			.clk(clock),
			.reset_n(reset)
		);
	end
	endgenerate
	
	generate 
		for (i=0; i< ncount; i=i+1) begin : pnode_gen
			matchblock_wrapper #(.blocktype(1)) mb (
				.clock,
				.reset(!reset),
				.mask_data_out(pnodeout[i]),
				.mask_data_valid(pnodeout_valid[i]),
				.mask_data_ack(pnodeout_ack[i]),
				.mask_pnode_ready(pnode_ready[i]),
				.mask_pnode_data(pnode_data[i]),
				.mask_pnode_valid(pnode_valid[i]),
				.coe_localfreeze(local_freeze[i]),
				.coe_enable(local_enable[i]),
				.coe_globalfreeze(global_freeze),
				.avs_update_write(),
				.avs_update_read(),
				.avs_update_writedata(),
				.avs_update_readdata(),
				.avs_update_address()
			);
		end
	endgenerate

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
			.tag_data(tagin_data),
			.tag_valid(tagin_valid),
			.tag_ready(tagin_ready),
			.dataout(pnodeout),
			.data_valid(pnodeout_valid),
			.data_ack(pnodeout_ack)
	);
	
	eth4to1_eth_in_mux sysmux(
		.clk(clock),
		.reset_n(reset),
		.out_channel(stream_channel),
		.out_valid(stream_valid),
		.out_ready(stream_ready),
		.out_data(stream_data),
		.out_startofpacket(stream_sop),
		.out_endofpacket(stream_eop),
		.out_empty(),
		.in0_channel(doubleout_channel[0]),
		.in0_valid(doubleout_valid[0]),
		.in0_ready(doubleout_ready[0]),
		.in0_data(doubleout_data[0]),
		.in0_startofpacket(doubleout_sop[0]),
		.in0_endofpacket(doubleout_eop[0]), 
		.in0_empty(4'd0),
		.in1_channel(doubleout_channel[1]),
		.in1_valid(doubleout_valid[1]),
		.in1_ready(doubleout_ready[1]),
		.in1_data(doubleout_data[1]),
		.in1_startofpacket(doubleout_sop[1]),
		.in1_endofpacket(doubleout_eop[1]), 
		.in1_empty(4'd0),
		.in2_channel(doubleout_channel[2]),
		.in2_valid(doubleout_valid[2]),
		.in2_ready(doubleout_ready[2]),
		.in2_data(doubleout_data[2]),
		.in2_startofpacket(doubleout_sop[2]),
		.in2_endofpacket(doubleout_eop[2]), 
		.in2_empty(4'd0),
		.in3_channel(doubleout_channel[3]),
		.in3_valid(doubleout_valid[3]),
		.in3_ready(doubleout_ready[3]),
		.in3_data(doubleout_data[3]),
		.in3_startofpacket(doubleout_sop[3]),
		.in3_endofpacket(doubleout_eop[3]), 
		.in3_empty(4'd0)
	);
	
	reg [31:0] incount;
	reg [31:0] outcount;
	reg [31:0] diffcount;
	reg [3:0] pktcount;
	reg [4:0] rng;
	
	reg [9:0] offcount;
	reg xoff_old;
	
	reg [5:0] tagold;
	reg [5:0] stream_channel_check;
	reg [5:0] pnodeout_check;
	reg [5:0] pnodein_check;
	
	initial begin
		clock = 0;
		forever #5 clock = ~clock;
	end

	integer x;

	always @(negedge clock)
		for (x=0;x<4;x=x+1)
			packetin_data[x] <= {$random,$random};

	initial begin
		for (x=0; x<4; x=x+1) begin
			packetin_valid[x] = 0;
			transmitout_ready[x] = 0;
		end
		reset = 0;
		offcount = 0;
		pktcount = 0;
		incount = 0;
		outcount = 0;
		diffcount = 0;
		tagold = 0;
		stream_channel_check = 0;
		pnodeout_check = 0;
		pnodein_check = 0;
		#10 reset = 1;
	//	#10 packetin_valid[0] = packetin_ready[0];
	end

	always@(posedge clock) begin
		xoff_old <= xoff;
		if (xoff && !xoff_old && offcount != 0)
			;//$stop;
		else if (xoff && !xoff_old)
			offcount <= 10'h3FF;
		else if (offcount !=0)
			offcount <= offcount - 1;
	end
	
	always@(posedge clock) begin
		rng <= $random;
		//transmitout_ready[0] <= $random & $random & transmitout_valid[0];
		if (packetin_eop[0] & packetin_ready[0] & packetin_valid[0])
			pktcount <= 0;
		else if (packetin_ready[0] & packetin_valid[0])
			pktcount <= pktcount + 1;
		if (packetin_eop[0] & packetin_ready[0] & packetin_valid[0])
			incount <= incount + 1;
		if (transmitout_eop[0] & transmitout_ready[0] & transmitout_valid[0])
			outcount <= outcount + 1;
	end

	always@* begin
		transmitout_ready[0] = (|rng) & transmitout_valid[0];
		packetin_eop[0] = pktcount == 5;
		packetin_sop[0] = pktcount == 0;
		packetin_empty[0] = incount[2:0];
	end

/*	always @(posedge clock)
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
	*/
	always@(*)
		if (incount < 10000)
			packetin_valid[0] = !(pktcount==0 && offcount != 0);//packetin_ready[0];
		else
			packetin_valid[0] = 0;
			
	always@(posedge clock)
		if (diffcount < incount - outcount)
			diffcount <= incount - outcount;
	
	always@(posedge clock)
	if (outcount >= 10000)
		#200 $stop;
		
	always@(posedge clock)
	if (transmitout_eop[0] & transmitout_ready[0] & transmitout_valid[0] & transmitout_empty[0] != outcount[2:0])
		$stop;
	
	always@(posedge clock)
		if (tagin_ready && tagin_valid)
			if (tagold != (tagin_data[5:0]))
				$stop;
			else
				tagold <= tagold + 1;
				
	always@(posedge clock)
		if (stream_eop & stream_ready & stream_valid)
			if (stream_channel != stream_channel_check)
				$stop;
			else 
				stream_channel_check <= stream_channel_check + 1;
	
/* 	function logic checkvarinc (input int current, expected, input logic valid);
		if (valid) begin
			checkvarinc = current==expected;
			if (checkvarinc) expected = expected + 1;
		end
		else checkvarinc = 1;
	endfunction */
		
	always@(posedge clock)
		if (pnodeout_valid[0]&&pnodeout_ack[0]) 
			if (pnodeout[0] != pnodeout_check)
				$stop;
			else 
				pnodeout_check <= pnodeout_check + 1;
				
	always@(posedge clock)
		if (pnode_valid[0]/*&&pnode_ready[0]*/&&pnode_data[0][128]) 
			if (pnode_data[0][135:130] != pnodein_check)
				$stop;
			else 
				pnodein_check <= pnodein_check + 1;
	
		
/* 	always@(posedge clock)
		// if (checkvarinc(pnodeout[0], pnodeout_check, pnodeout_valid[0]&&pnodeout_ack[0]))
			// pnodeout_check <= pnodeout_check + 1;
		// else
		if (!checkvarinc(pnodeout[0], pnodeout_check, pnodeout_valid[0]&&pnodeout_ack[0]))
			$stop; */
	
	reg [63:0] datacheck [8191:0];
	reg [12:0] wridx, rdidx;
	
	initial begin
		wridx = 0;
		rdidx = 0;
	end
	
	always@(posedge clock) begin
		if (packetin_ready[0] & packetin_valid[0]) begin
			wridx <= wridx + 1;
			datacheck[wridx] <= packetin_data[0];
		end
		if (transmitout_ready[0] & transmitout_valid[0]) begin
			rdidx <= rdidx + 1;
			if (datacheck[rdidx] != transmitout_data[0]) begin
				for (x=0; x<8192; x=x+1)
					if (datacheck[x] == transmitout_data[0])
						$display("Got element %d instead of element %d!", x, rdidx);
				$stop;
			end
		end
	end
	
	wire [63:0] currread = datacheck[rdidx];
	
endmodule
