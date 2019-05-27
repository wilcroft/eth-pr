module packetstorage (
	input clock,
	input reset,
	input [63:0] instream_data,
	input instream_valid,
	input instream_sop,
	input instream_eop,
	output instream_ready, //y
	output [63:0] outstream_data, //y
	output outstream_valid, //y
	output outstream_sop, //y
	output outstream_eop, //y
	output [5:0] outstream_channel,
	input outstream_ready,
	
	input [7:0] tagstream_data,
	input tagstream_valid,
	output tagstream_ready,
	
	output [63:0] sendstream_data,
	output reg sendstream_valid,
	output reg sendstream_sop,
	output reg sendstream_eop,
	output reg [1:0] sendstream_channel,
	input sendstream_ready
	);
	
	
	reg [5:0] tag; 
	reg [4:0] plength, currlength;
	reg [13:0] address, start_address, read_address, read_address_base;
	reg [1:0] out_iface;
	reg get_read_addr, ss_sopbuf, ss_eopbuf;
	
	wire [19:0] pt_data, pt_q;
	wire [63:0] pm_q;
	
	assign outstream_data = instream_data;
	assign outstream_sop = instream_sop;
	assign outstream_eop = instream_eop;
	assign outstream_valid = instream_valid;
	assign instream_ready = outstream_ready;
	assign outstream_channel = tag;
	
	//debug
	//end debug
	
	always@(posedge clock)
		if (reset) tag <= 0;
		else if (instream_eop && instream_ready && instream_valid) tag <= tag +6'b1;
	
	always@(posedge clock)
		if (reset) plength <= 1;
		else if (instream_eop && instream_ready && instream_valid) plength <= 5'b1;
		else if (instream_ready && instream_valid) plength <= plength + 5'b1;
		
	always@(posedge clock)
		if (reset) address <= 0;
		else if (instream_valid && instream_ready) address <= address + 14'b1;
	
	always@(posedge clock)
		if (reset) start_address <= 0;
		else if (instream_sop && instream_ready && instream_valid) start_address <= address;
	
	assign pt_data = {start_address, plength};
	always@(posedge clock)
		if (reset) out_iface <= 0;
		else if (tagstream_valid && tagstream_ready) out_iface <= tagstream_data[7:6];
	
	always@(posedge clock)
		if (reset) sendstream_channel <= 0;
		else if (tagstream_valid && tagstream_ready) sendstream_channel <= tagstream_data [7:6];
		
	always@(posedge clock)
		if (reset) get_read_addr <= 0;
		else if (tagstream_valid && tagstream_ready) get_read_addr <= 1'b1;
		else get_read_addr <= 0;
	
	assign tagstream_ready = (read_address == (read_address_base + currlength)) &&!get_read_addr;
	
	always@(posedge clock)
		if (reset) begin
			read_address <= 0;
			currlength <= 0;
			read_address_base <= 0;
		end
		else if (get_read_addr) begin
			{read_address,currlength} <= pt_q;
			{read_address_base,currlength} <= pt_q;
		end
		else if (read_address < (read_address_base + currlength) && sendstream_ready)
			read_address <= read_address + 14'b1;
	
	always@(posedge clock)
		if (reset) sendstream_valid <= 0;
		else if (read_address < (read_address_base + currlength)) sendstream_valid <= 1;
		else sendstream_valid <= 0;
	
	assign sendstream_data = pm_q;
	
	always@* begin
		ss_sopbuf = (read_address == read_address_base);
		ss_eopbuf = read_address == (read_address_base + currlength - 14'b1);
	end
	
	always@(posedge clock) 
		if (reset) begin
			sendstream_sop <= 0;
			sendstream_eop <= 0;
		end
		else begin
			sendstream_sop <= ss_sopbuf;
			sendstream_eop <= ss_eopbuf;
		end
	

	packettable PT (.clock(clock),
						 .data(pt_data),
						 .rdaddress(tagstream_data[5:0]),
						 .wraddress(tag),
						 .wren(instream_eop),
						 .q(pt_q));
						
	packetmem PM ( .clock(clock),
						.data(instream_data),
						.rdaddress(read_address),
						.wraddress(address),
						.wren(instream_valid),
						.q(pm_q));
		
endmodule
