module pmem_group(
		input clock,
		input reset,
		
		// Data arriving from interfaces
		input [63:0] packetin_data [3:0],
		input packetin_valid [3:0],
		input packetin_sop [3:0],
		input packetin_eop [3:0],
		output packetin_ready [3:0],
		
		// Passthrough of packetin, but with tag information
		output [63:0] packetout_data [3:0],
		output packetout_valid [3:0],
		output packetout_sop [3:0],
		output packetout_eop [3:0],
		input packetout_ready [3:0],
		output reg [5:0] packetout_channel [3:0],
		
		// Output data
		output reg [63:0] transmitout_data [3:0],
		output reg transmitout_valid [3:0],
		output reg transmitout_sop [3:0],
		output reg transmitout_eop [3:0],
		input transmitout_ready [3:0],
		
		// Match results
		input [9:0] tagin_data,
		input tagin_valid,
		output reg tagin_ready
	);
	
	reg [11:0] rdaddr [3:0];
	reg [11:0] wraddr [3:0];
	reg [11:0] wraddr_start [3:0];
	
	wire [63:0] memout [3:0] [3:0];
	reg wren [3:0];
	
	reg [17:0] pt_data [3:0];
	wire [17:0] pt_q [3:0];
	reg [5:0] tag [3:0];
	reg [5:0] plength [3:0];
	
	reg tagin_valid_pipe[0:0];
	reg [3:0] tagin_iface_pipe[0:0];
	
	reg [1:0] match_in_iface;
	reg [1:0] match_out_iface;
	
	reg [19:0] cmdq_datain [3:0];
	reg cmdq_rdreq [3:0];
	reg cmdq_wrreq [3:0];
	wire cmdq_full [3:0];
	wire cmdq_empty [3:0];
	wire [19:0] cmdq_dataout [3:0];
	
	assign packetin_ready = packetout_ready;
	assign packetout_valid = packetin_valid;
	assign packetout_data = packetin_data;
	assign packetout_sop = packetin_sop;
	assign packetout_eop = packetin_eop;
		
	genvar i, j;
	integer x, y;
	
	generate
		for (i=0; i<4; i=i+1) begin:inloop //i=input
			for (j=0; j<4; j=j+1) begin:outloop //j=output
				//We need 16 packet memories, to fully multiplex
				//between the 4 outputs
				packetmem2 mem (
					.clock(clock),
					.data(packetin_data[i]),
					.rdaddress(rdaddr[j]),
					.wraddress(wraddr[i]),
					.wren(wren[i]),
					.q(memout[i][j])		
				);
			end
			// We need four lookup tables, one per input.
			// Since output arrives serially before dispatching,
			// we can get away with this.
			packettable PT (
				.clock(clock),
				.data(pt_data[i]),
				.rdaddress(tagin_data[5:0]),
				.wraddress(tag[i]),
				.wren(packetin_eop[i]),
				.q(pt_q[i])
			);
			// One cmmand queue per interface to not bottleneck the lookup tables
			output_cmdq CMDQ (
				.clock(clock),
				.sclr(reset),
				.rdreq(cmdq_rdreq[i]),
				.wrreq(cmdq_wrreq[i]),
				.data(cmdq_datain[i]),
				.empty(cmdq_empty[i]),
				.full(cmdq_full[i]),
				.q(cmdq_dataout[i])
			);
		end
	endgenerate
	
	// Assign packet memory write enables
	always@*
		for (x=0; x<4; x=x+1) begin	
			wren[x] = packetin_ready[x] && packetin_valid[x];
		end
		
	//generate the per-interface tag
	always@(posedge clock)
		for (x=0; x<4; x=x+1)
			if (reset) tag[x] <= 6'b0;
			else if (packetin_eop[x] && packetin_ready[x] && packetin_valid[x]) tag[x] <= tag[x] + 6'b1;
	
	// Calculate the per-interface packet length
	always@(posedge clock)
		for (x=0; x<4; x=x+1)
			if (reset) plength[x] <= 6'b1;
			else if (packetin_eop[x] && packetin_ready[x] && packetin_valid[x]) plength[x] <= 6'b1;
			else if (packetin_ready[x] && packetin_valid[x]) plength[x] <= plength[x] + 6'b1;
	
	// Calculate per-interface packet write addresses
	always@(posedge clock)
		for (x=0; x<4; x=x+1)
			if (reset) wraddr[x] <= 12'd0;
			else if (packetin_ready[x] && packetin_valid[x]) wraddr[x] <= wraddr[x] + 12'd1;
	
	// Get the first address for the packet (for writing to table), per interface
	always@(posedge clock)
		for (x=0; x<4; x=x+1)
			if (reset) wraddr_start[x] <= 0;
			else if (packetin_sop[x] && packetin_valid [x] && packetin_ready [x]) wraddr_start[x] <= wraddr[x];
	
	
	// Set the PT lookup inputs, assign tags to channels
	always@* 
		for (x=0; x<4; x=x+1) begin
			pt_data[x] = {wraddr_start[x],plength[x]};
			packetout_channel[x] = tag [x];
		end
	
	// some pipelined signals
	always@(posedge clock) begin
		tagin_valid_pipe[0] <= tagin_valid;
		tagin_iface_pipe[0] <= tagin_data [9:6];
	end
	
	always@* begin
		match_in_iface = tagin_iface_pipe[0][1:0];
		match_out_iface = tagin_iface_pipe[0][3:2];
	end
	
	// Mux for packet table outputs
	always@* begin
		for (x=0; x<4; x=x+1)
			//cmdq_wrreq[x] = !cmdq_full[x] && tagin_valid_pipe[0] && (tagin_iface_pipe[0][1:0] == x);
			cmdq_wrreq[x] = !cmdq_full[x] && tagin_valid_pipe[0] && (match_in_iface == x);
	end
	
	// cmdq processing
	reg [5:0] cmdq_length [3:0];
	reg [13:0] cmdq_addr [3:0];
	reg cmdq_valid [3:0];
	reg cmdq_ready [3:0];
	reg cmdq_ready_pipe [3:0];
	reg [1:0] cmdq_memselect[3:0];
	
	always@(posedge clock)
		for (x=0; x<4; x=x+1)
			if (reset) cmdq_ready[x] <= 0;
			else cmdq_ready[x] <= cmdq_rdreq[x];
	
	
			
	always@ (posedge clock)
		for (x=0; x<4; x=x+1)begin
			if (reset) begin
				cmdq_length[x] <= 0;
				cmdq_addr[x] <= 0;
			end
			else begin
				if ( cmdq_ready[x]) //!cmdq_empty[x] && transmitout_ready[x] &&
					{cmdq_addr[x], cmdq_length[x]} <= cmdq_dataout [x];
				else if (transmitout_ready[x] && cmdq_length[x] != 0) begin
					cmdq_length[x] <= cmdq_length[x]-6'd1;
					cmdq_addr[x] <= cmdq_addr[x]+14'd1;
				end
			end
		end
	
	always@(posedge clock)
		for (x=0; x<4; x=x+1) begin
			transmitout_valid[x] <= cmdq_length[x] != 0 || (transmitout_valid[x] && !transmitout_ready[x]);
			transmitout_eop[x] <= (cmdq_length[x] == 1 && transmitout_ready[x])  || (transmitout_eop[x] && !transmitout_ready[x]);
			cmdq_ready_pipe[x] <= cmdq_ready[x];
			transmitout_sop[x] <= cmdq_ready_pipe[x] || transmitout_sop[x] && !transmitout_ready[x];
		end
	
	//always@*
	//	for (x=0; x<4; x=x+1) begin
	//		transmitout_eop[x] = transmitout_valid[x] && cmdq_length[x] == 0;
	//	end
		
	always@*
		for (x=0;x<4;x=x+1) begin
			cmdq_rdreq[x] = cmdq_length[x] == 0 && !cmdq_ready[x] && !cmdq_empty[x] && (!transmitout_eop[x] || transmitout_eop[x] && transmitout_valid[x] && transmitout_ready[x]);
			//cmdq_datain[x] = {tagin_iface_pipe[0][3:2],pt_q[tagin_iface_pipe[0][3:2]]};
			cmdq_datain[x] = {match_out_iface,pt_q[match_out_iface]};
		end
		
	always@(posedge clock) 
		for (x=0;x<4;x=x+1) cmdq_memselect[x] = cmdq_addr[x][13:12];
		
	always@*
		for (x=0; x<4; x=x+1) begin
			rdaddr[x] = cmdq_addr[x][11:0];
			transmitout_data[x] = memout[cmdq_addr[x][13:12]][x];
		end
	
	always@* begin
		tagin_ready = 1;
		for (x=0; x<4; x=x+1)
			tagin_ready = tagin_ready & !cmdq_full[x];
	end
	
endmodule
