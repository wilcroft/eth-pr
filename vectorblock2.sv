`include "headercap_def.vh"
module vectormatchblock2_128 #(parameter RCOUNT = 104, SPLITSIZE=4) (
	input clock,
	input reset,
	input avs_update_write,
	input [31:0] avs_update_writedata,
	input [0:0] avs_update_address,
	
	output [13:0] match_data_out,
	output match_data_valid,
	input match_data_ack,
	
	output reg pnode_ready,
	input [141:0] pnode_data,
	input pnode_valid
	);
	
	localparam NCOUNT = CONCAT_WIDTH/SPLITSIZE/2;
	
	integer i, j;
	
	wire [127:0] cap_data;
	wire cap_sop, cap_eop, cap_valid, cap_ready;
	
	wire fifo_empty, fifo_full;
	
	wire [CONCAT_WIDTH-1:0] concat;
	wire [CONCAT_WIDTH-1+12:0] concat_out;
	wire concat_valid, concat_ready;
	wire concat_full, concat_empty, concat_almost;
	reg [CONCAT_WIDTH-1+12:0] concat_reg;
	reg concat_reg_valid;
	
	wire [13:0] data_out;

	reg [11:0] tag_capture;

	reg [11:0] tag_in;
	reg [11:0] tag_out;
	
	reg [RCOUNT-1:0] rulevector, vectoredAND;
	reg [RCOUNT-1:0] vectoredbits [NCOUNT-1:0];
	reg [RCOUNT-1:0] vectoredbits_reg [NCOUNT-1:0];
	reg vectoredbits_valid;
	
	reg [CONCAT_WIDTH/2-1:0] rulebits [3:0][RCOUNT-1:0];
	reg [RCOUNT-1:0] rulebitsread [3:0][CONCAT_WIDTH/2-1:0];
	
	reg [$clog2(SPLITSIZE)-1:0] rdidx, rdidx_reg;
	reg [$clog2(RCOUNT)-1:0] wridx;
	
	assign {cap_sop, cap_eop, cap_data} = pnode_data[129:0];
	
	assign concat_ready = !concat_almost;
	
	assign pnode_ready = !concat_almost;
	assign cap_valid = pnode_valid;
	
	wire outfifo_wrreq;
	assign outfifo_wrreq = concat_reg_valid && rdidx == SPLITSIZE-1 && !fifo_full;
	
	assign match_data_valid = !fifo_empty;
	assign match_data_out = data_out;
	
	always@(posedge clock) begin
		if (cap_valid && cap_eop)
			tag_capture <= pnode_data [141-:12];
	end
	
// SUBMODULES //
	
	header_capture_128 headercap (
		.clk(clock),
		.avalon_st_rx_sop (cap_sop),
		.avalon_st_rx_valid(cap_valid),
		.avalon_st_rx_data(cap_data),
		.avalon_st_rx_empty(),
		.avalon_st_rx_error(),                 
		.avalon_st_rx_eop(cap_eop),
		.avalon_st_rx_ready(cap_ready),
		.concat,
		.concat_valid,
		.concat_ready
	);
	
	scfifo concatfifo (
		.clock(clock),
		.data({tag_capture,concat}),
		.rdreq(!concat_empty&&(outfifo_wrreq||!concat_reg_valid)),
//		.rdreq(concat_rdreq&&!concat_empty),
		.wrreq(concat_valid&&!concat_full),
		.empty(concat_empty),
		.full(concat_full),
		.almost_full(concat_almost),
		.q(concat_out)
	);
	defparam concatfifo.add_ram_output_register = "OFF",
		concatfifo.lpm_width = CONCAT_WIDTH+12,
		concatfifo.lpm_widthu = 4,
		concatfifo.lpm_numwords = 16,
		concatfifo.almost_full_value = 14,
		concatfifo.lpm_showahead = "ON";
	
	initial concat_reg_valid = 0;
	
	always@(posedge clock) begin
		if (!concat_reg_valid && !concat_empty) begin
			concat_reg <= concat_out;
			concat_reg_valid <= 1;
		end
		else if (outfifo_wrreq && concat_empty)
			concat_reg_valid <= 0;
		else if (outfifo_wrreq && !concat_empty)
			concat_reg <= concat_out;
	end
	
	hardblockfifo matchfifo (
		.clock,
		.data({tag_out[11:10],tag_out}),
		.rdreq(match_data_ack),
		.wrreq(outfifo_wrreq&&rulevector!=0),
		.empty(fifo_empty),
		.full(fifo_full),
		.q(data_out)
	);
		
wire write, newrulein_empty;
reg wrhigh;
wire [CONCAT_WIDTH/2-1:0] newrulein;
assign write = !newrulein_empty;

	newrulefifo #(.CONCAT_WIDTH(CONCAT_WIDTH/2)) NRF (
		.clock,
		.reset,
		.data(avs_update_writedata),
		.q(newrulein),
		.wrreq(avs_update_write),
		.rdack(write),
		.empty(newrulein_empty)
	);
	
	always@(posedge clock) begin
		if (write) begin
			rulebits [wrhigh][wridx] <= newrulein;
			wrhigh <= ~wrhigh;
			if (wrhigh)
				wridx <= wridx + 1;
		end
	end
		
	always@(posedge clock) begin
		if (reset)
			rulevector <= {RCOUNT{1'b1}};
		else if (vectoredbits_valid && rdidx_reg == SPLITSIZE-1 && !fifo_full)
			rulevector <= {RCOUNT{1'b1}};		
		else if (vectoredbits_valid && (!fifo_full || rdidx_reg != SPLITSIZE-1))
			rulevector <= rulevector & vectoredAND;
	end
	
	always@(posedge clock) begin
		vectoredbits_valid <= concat_reg_valid;
		if (concat_reg_valid && (!fifo_full || rdidx != SPLITSIZE-1)) begin
			rdidx_reg <= rdidx;
			for (i=0; i<NCOUNT; i=i+1)
				vectoredbits_reg[i] <= vectoredbits[i];
		end
	end
	
	always@(posedge clock)
		if (reset)
			rdidx <= 0;
		else if (concat_reg_valid && rdidx == SPLITSIZE-1 && !fifo_full)
			rdidx <= 0;
		else if (concat_reg_valid && (!fifo_full || rdidx != SPLITSIZE-1))
			rdidx <= rdidx + 1;
	
	always@(*) begin
		vectoredAND = {RCOUNT{1'b1}};
		for (i = 0; i < NCOUNT; i = i+1) begin
			vectoredbits[i] = rulebitsread[concat_reg[(i*SPLITSIZE+rdidx)*2+:2]][i*SPLITSIZE+rdidx];
			vectoredAND = vectoredAND & vectoredbits_reg[i];
		end
	end
	
	always@* begin
		for (i=0; i<CONCAT_WIDTH/2; i=i+1)
			for (j=0; j<RCOUNT; j=j+1) begin
				rulebitsread[0][i][j] = rulebits[0][j][i];
				rulebitsread[1][i][j] = rulebits[1][j][i];
				rulebitsread[2][i][j] = rulebits[2][j][i];
				rulebitsread[3][i][j] = rulebits[3][j][i];
			end
	end
	
	always@* 
		tag_out = concat_reg[CONCAT_WIDTH+:12];
	
	initial begin
		rulebits[0][0] = {CONCAT_WIDTH/2{1'b1}};
		rulebits[1][0] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[2][0] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[3][0] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[0][1] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[1][1] = {CONCAT_WIDTH/2{1'b1}};
		rulebits[2][1] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[3][1] = {CONCAT_WIDTH/2{1'b0}};
		rulebits[0][2] = {CONCAT_WIDTH/2{1'b1}};
		rulebits[1][2] = {CONCAT_WIDTH/2{1'b1}};
		rulebits[2][2] = {CONCAT_WIDTH/2{1'b1}};
		rulebits[3][2] = {CONCAT_WIDTH/2{1'b1}};
	//	rulebits[1][2] = 120'hd609b1f0566312153523c089b1f081;
	//	rulebits[0][2] = 120'h29f64e0fa99cedeacadc3f764e0f7e;
		
		for (i=3; i<RCOUNT; i=i+1) begin
			rulebits[0][i] = {CONCAT_WIDTH/2{1'b0}};
			rulebits[1][i] = {CONCAT_WIDTH/2{1'b0}};
			rulebits[2][i] = {CONCAT_WIDTH/2{1'b0}};
			rulebits[3][i] = {CONCAT_WIDTH/2{1'b0}};
		end
	end
	
	reg [RCOUNT-1:0] bitsreaddebug [NCOUNT-1:0];
	reg [1:0] hilo [NCOUNT-1:0];
	always@* begin
		for (i=0; i<NCOUNT; i=i+1) begin
			bitsreaddebug[i] = rulebitsread[concat_reg[(i*SPLITSIZE+rdidx)*2+:2]][i*SPLITSIZE+rdidx];
			hilo[i] = concat_reg[(i*SPLITSIZE+rdidx)*2+:2];
		end
	end
	
endmodule

//  d609b1f0566312153524c089b1f081
// sip dip sport dport eproto ipproto
// d609b1f0 56631215 3524 c089 b1f0 81  (1's)
// 29f64e0f a99cedea cadb 3f76 4e0f 7e	(0's)