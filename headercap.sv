`include "headercap_def.vh"
module header_capture(
	input clk,
	input avalon_st_rx_sop,
	input avalon_st_rx_valid,
	input [63:0] avalon_st_rx_data,
	input [2:0] avalon_st_rx_empty,
	input avalon_st_rx_error,                 
	input avalon_st_rx_eop,
	output avalon_st_rx_ready,
	output reg [CONCAT_WIDTH-1:0] concat,
	output reg concat_valid,
	input concat_ready
	);
	
	reg [2:0] state, nextState;
	
	assign avalon_st_rx_ready = 1;// concat_ready;

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
			s6: nextState = s6;
			default: nextState = s0;
		endcase
	end		

	initial
		state = s0;			
			
	
	always@(posedge clk)
		if (state == s1) 
			//isVlan <= (avalon_st_rx_data[47:32] == 'h8100);
			isVlan <= (avalon_st_rx_data[31:16] == 'h8100);
	
	
`ifdef USE_DMAC
	reg [`MAC_LEN-1:0] dmac;
	always@(posedge clk)
		if (state == s0) 
			//dmac <= avalon_st_rx_data [47:0];
			dmac <= avalon_st_rx_data[63:16];
`endif
`ifdef USE_SMAC
	reg [`MAC_LEN-1:0] smac;
	always@(posedge clk)
		if (state == s0)
//			smac[15:0] <= avalon_st_rx_data [63:48
			smac[47:32] <= avalon_st_rx_data[15:0];
		else if (state == s1)
//			smac[47:16] <= avalon_st_rx_data[31:0];
			smac[31:0] <= avalon_st_rx_data[63:32];
`endif
`ifdef USE_EPROTO
	reg [`EPROTO_LEN-1:0] eproto;
	always@(posedge clk)
//		if (state == s1 && avalon_st_rx_data[47:32] != 'h8100)
		if (state == s1 && avalon_st_rx_data[31:16] != 'h8100)
//				eproto <= avalon_st_rx_data[47:32];
				eproto <= avalon_st_rx_data[31:16];
		else if (state == s2 && isVlan)
//			eproto <= avalon_st_rx_data[15:0];
			eproto <= avalon_st_rx_data[63:48];
`endif
`ifdef USE_DPORT
	reg [`PORT_LEN-1:0] dport;
	always@(posedge clk)
//		if (state == s5) begin
//			if (!isVlan) 
//				dport <= avalon_st_rx_data[15:0];
//			else
//				dport <= avalon_st_rx_data[47:32];
//		end
		if (state == s4 && !isVlan)
				dport <= avalon_st_rx_data[31:16];
		else if (state == s5 && isVlan)
				dport <= avalon_st_rx_data[63:48];
`endif
`ifdef USE_SPORT
	reg [`PORT_LEN-1:0] sport;
	always@(posedge clk)
		if (state == s4 && !isVlan)
//			sport <= avalon_st_rx_data[63:48];
			sport <= avalon_st_rx_data[47:32];
//		else if (state == s5 && isVlan)
		else if (state == s4 && isVlan)
//			sport <= avalon_st_rx_data[31:16];
			sport <= avalon_st_rx_data[15:0];
`endif
`ifdef USE_IPLEN
	reg [`IPLEN_LEN-1:0] iplen;
	always@(posedge clk)
		if (state == s2)
			if (!isVlan)
//				iplen <= avalon_st_rx_data[15:0];
				iplen <= avalon_st_rx_data[63:48];
			else 
//				iplen <= avalon_st_rx_data[47:32];
				iplen <= avalon_st_rx_data[31:16];
`endif
`ifdef USE_IPPROTO
	reg [`IPPROTO_LEN-1:0] ipproto;
	always@(posedge clk)
		if (state == s2 && !isVlan)
//			ipproto <= avalon_st_rx_data[63:56];
			ipproto <= avalon_st_rx_data[7:0];
		else if (state == s3 && isVlan)
//			ipproto <= avalon_st_rx_data[31:24];
//			ipproto <= avalon_st_rx_data[47:32];
			ipproto <= avalon_st_rx_data[39:32];

`endif
`ifdef USE_SIP4
	reg [`IP4_LEN-1:0] sip4;
	always@(posedge clk)
		if (state == s3 && !isVlan)
			sip4 <= avalon_st_rx_data[47:16];
		else if (state == s3 && isVlan)
//			sip4[15:0] <= avalon_st_rx_data[63:48];
			sip4[15:0] <= avalon_st_rx_data[15:0];
		else if (state == s4 && isVlan)
//			sip4[31:16] <= avalon_st_rx_data[15:0];
			sip4[31:16] <= avalon_st_rx_data[63:48];
`endif
`ifdef USE_DIP4
	reg [`IP4_LEN-1:0] dip4;
	always@(posedge clk)
		if (state == s3 && !isVlan)
//			dip4[15:0] <= avalon_st_rx_data [63:48];
			dip4[31:16] <= avalon_st_rx_data [15:0];
		else if (state == s4 && !isVlan)
//			dip4[31:16] <= avalon_st_rx_data [15:0];
			dip4[15:0] <= avalon_st_rx_data [63:48];
		else if (state == s4 && isVlan)
			dip4 <= avalon_st_rx_data [47:16];
`endif
			
			
	assign concat = {1'b0 
		`ifdef USESMAC
			, smac
		`endif
		`ifdef USE_DMAC 
			,dmac
		`endif
		`ifdef USE_SIP4 
			,sip4
		`endif
		`ifdef USE_DIP4 
			,dip4
		`endif
		`ifdef USE_SPORT 
			,sport
		`endif
		`ifdef USE_DPORT 
			,dport
		`endif
		`ifdef USE_EPROTO
			,eproto
		`endif
		`ifdef USE_IPLEN 
			,iplen
		`endif
		`ifdef USE_IPPROTO 
			,ipproto
		`endif
		};
		
	always@(posedge clk)
		if (avalon_st_rx_eop)
			concat_valid <= 1;
		else if (concat_ready)
			concat_valid <= 0;
	
	initial concat_valid = 0;
	
endmodule
