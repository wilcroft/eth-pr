`include "headercap_def.vh"
module header_capture(
	input clk,
	input avalon_st_rx_sop,
	input avalon_st_rx_valid,
	input [63:0] avalon_st_rx_data,
	input [2:0] avalon_st_rx_empty,
	input avalon_st_rx_error,                 
	input avalon_st_rx_eop,
	output avalon_st_rx_ready
	);
	
	reg [2:0] state, nextState;
	
	reg [ 0 
		`ifdef USESMAC
			+ `MAC_LEN
		`endif
		`ifdef USE_DMAC 
			+ `MAC_LEN
		`endif
		`ifdef USE_EPROTO
			+ `EPROTO_LEN
		`endif
		`ifdef USE_DPORT 
			+ `PORT_LEN
		`endif
		`ifdef USE_SPORT 
			+ `PORT_LEN
		`endif
		`ifdef USE_IPLEN 
			+ `IPLEN_LEN
		`endif
		`ifdef USE_IPPROTO 
			+ `IPPROTO_LEN
		`endif
		`ifdef USE_SIP4 
			+ `IP4_LEN
		`endif
		`ifdef USE_DIP4 
			+ `IP4_LEN
		`endif
		-1:0] concat;

	parameter s0 = 0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6;
	
	reg isVlan;

	always@(posedge clk) begin
		if (avalon_st_rx_valid)
			state <= nextState;
	end

	always@* begin
		nextState = state;
		if (avalon_st_rx_eop)
			nextState = s0;
		case (state)
			s0: nextState = avalon_st_rx_sop?s1:state;
			s1: nextState = s2;
			s2: nextState = s3;
			s3: nextState = s4;
			s4: nextState = s5;
			s5: nextState = s6;
		endcase
	end		

	initial
		state = s0;			
			
	
	always@(posedge clk)
		if (state == s1) 
			isVlan <= (avalon_st_rx_data[47:32] == 'h8100);
			
	
`ifdef USE_DMAC
	reg [`MAC_LEN-1:0] dmac;
	always@(posedge clk)
		if (state == s0) 
			dmac <= avalon_st_rx_data [47:0];
`endif
`ifdef USE_SMAC
	reg [`MAC_LEN-1:0] smac;
	always@(posedge clk)
		if (state == s0)
			smac[15:0] <= avalon_st_rx_data [63:48];
		else if (state == s1)
			smac[47:16] <= avalon_st_rx_data[31:0];
`endif
`ifdef USE_EPROTO
	reg [`EPROTO_LEN-1:0] eproto;
	always@(posedge clk)
		if (state == s1 && avalon_st_rx_data[47:32] != 'h8100)
				eproto <= avalon_st_rx_data[47:32];
		else if (state == s2 && isVlan)
			eproto <= avalon_st_rx_data[15:0];
`endif
`ifdef USE_DPORT
	reg [`PORT_LEN-1:0] dport;
	always@(posedge clk)
		if (state == s5) begin
			if (!isVlan) 
				dport <= avalon_st_rx_data[15:0];
			else
				dport <= avalon_st_rx_data[47:32];
		end
`endif
`ifdef USE_SPORT
	reg [`PORT_LEN-1:0] sport;
	always@(posedge clk)
		if (state == s4 && !isVlan)
			sport <= avalon_st_rx_data[63:48];
		else if (state == s5 && isVlan)
			sport <= avalon_st_rx_data[31:16];
`endif
`ifdef USE_IPLEN
	reg [`IPLEN_LEN-1:0] iplen;
	always@(posedge clk)
		if (state == s2)
			if (!isVlan)
				iplen <= avalon_st_rx_data[15:0];
			else 
				iplen <= avalon_st_rx_data[47:32];
`endif
`ifdef USE_IPPROTO
	reg [`IPPROTO_LEN-1:0] ipproto;
	always@(posedge clk)
		if (state == s2 && !isVlan)
			ipproto <= avalon_st_rx_data[63:56];
		else if (state == s3 && isVlan)
			ipproto <= avalon_st_rx_data[31:24];
`endif
`ifdef USE_SIP4
	reg [`IP4_LEN-1:0] sip4;
	always@(posedge clk)
		if (state == s3 && !isVlan)
			sip4 <= avalon_st_rx_data[47:16];
		else if (state == s3 && isVlan)
			sip4[15:0] <= avalon_st_rx_data[63:48];
		else if (state == s4 && isVlan)
			sip4[31:16] <= avalon_st_rx_data[15:0];
`endif
`ifdef USE_DIP4
	reg [`IP4_LEN-1:0] dip4;
	always@(posedge clk)
		if (state == s3 && !isVlan)
			dip4[15:0] <= avalon_st_rx_data [63:48];
		else if (state == s4 && !isVlan)
			dip4[31:16] <= avalon_st_rx_data [15:0];
		else if (state == s4 && isVlan)
			dip4 <= avalon_st_rx_data [47:16];
`endif
			
			

endmodule
