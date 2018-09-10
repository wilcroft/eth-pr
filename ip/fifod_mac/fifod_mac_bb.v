
module fifod_mac (
	clk_156_in_clk_clk,
	clk_312_in_clk_clk,
	mac10g_avalon_st_pause_data,
	mac10g_avalon_st_rxstatus_valid,
	mac10g_avalon_st_rxstatus_data,
	mac10g_avalon_st_rxstatus_error,
	mac10g_avalon_st_txstatus_data,
	mac10g_avalon_st_txstatus_valid,
	mac10g_avalon_st_txstatus_error,
	mac10g_csr_address,
	mac10g_csr_waitrequest,
	mac10g_csr_read,
	mac10g_csr_readdata,
	mac10g_csr_write,
	mac10g_csr_writedata,
	mac10g_link_fault_status_xgmii_rx_data,
	mac10g_xgmii_rx_data,
	mac10g_xgmii_tx_data,
	rst_in_reset_reset,
	rx_st_fifo_out_data,
	rx_st_fifo_out_valid,
	rx_st_fifo_out_ready,
	rx_st_fifo_out_startofpacket,
	rx_st_fifo_out_endofpacket,
	rx_st_fifo_out_empty,
	rx_st_fifo_out_error,
	tx_st_fifo_in_data,
	tx_st_fifo_in_valid,
	tx_st_fifo_in_ready,
	tx_st_fifo_in_startofpacket,
	tx_st_fifo_in_endofpacket,
	tx_st_fifo_in_empty,
	tx_st_fifo_in_error);	

	input		clk_156_in_clk_clk;
	input		clk_312_in_clk_clk;
	input	[1:0]	mac10g_avalon_st_pause_data;
	output		mac10g_avalon_st_rxstatus_valid;
	output	[39:0]	mac10g_avalon_st_rxstatus_data;
	output	[6:0]	mac10g_avalon_st_rxstatus_error;
	output	[39:0]	mac10g_avalon_st_txstatus_data;
	output		mac10g_avalon_st_txstatus_valid;
	output	[6:0]	mac10g_avalon_st_txstatus_error;
	input	[12:0]	mac10g_csr_address;
	output		mac10g_csr_waitrequest;
	input		mac10g_csr_read;
	output	[31:0]	mac10g_csr_readdata;
	input		mac10g_csr_write;
	input	[31:0]	mac10g_csr_writedata;
	output	[1:0]	mac10g_link_fault_status_xgmii_rx_data;
	input	[71:0]	mac10g_xgmii_rx_data;
	output	[71:0]	mac10g_xgmii_tx_data;
	input		rst_in_reset_reset;
	output	[63:0]	rx_st_fifo_out_data;
	output		rx_st_fifo_out_valid;
	input		rx_st_fifo_out_ready;
	output		rx_st_fifo_out_startofpacket;
	output		rx_st_fifo_out_endofpacket;
	output	[2:0]	rx_st_fifo_out_empty;
	output	[5:0]	rx_st_fifo_out_error;
	input	[63:0]	tx_st_fifo_in_data;
	input		tx_st_fifo_in_valid;
	output		tx_st_fifo_in_ready;
	input		tx_st_fifo_in_startofpacket;
	input		tx_st_fifo_in_endofpacket;
	input	[2:0]	tx_st_fifo_in_empty;
	input	[0:0]	tx_st_fifo_in_error;
endmodule
