	fifod_mac u0 (
		.clk_156_in_clk_clk                     (<connected-to-clk_156_in_clk_clk>),                     //                    clk_156_in_clk.clk
		.clk_312_in_clk_clk                     (<connected-to-clk_312_in_clk_clk>),                     //                    clk_312_in_clk.clk
		.mac10g_avalon_st_pause_data            (<connected-to-mac10g_avalon_st_pause_data>),            //            mac10g_avalon_st_pause.data
		.mac10g_avalon_st_rxstatus_valid        (<connected-to-mac10g_avalon_st_rxstatus_valid>),        //         mac10g_avalon_st_rxstatus.valid
		.mac10g_avalon_st_rxstatus_data         (<connected-to-mac10g_avalon_st_rxstatus_data>),         //                                  .data
		.mac10g_avalon_st_rxstatus_error        (<connected-to-mac10g_avalon_st_rxstatus_error>),        //                                  .error
		.mac10g_avalon_st_txstatus_data         (<connected-to-mac10g_avalon_st_txstatus_data>),         //         mac10g_avalon_st_txstatus.data
		.mac10g_avalon_st_txstatus_valid        (<connected-to-mac10g_avalon_st_txstatus_valid>),        //                                  .valid
		.mac10g_avalon_st_txstatus_error        (<connected-to-mac10g_avalon_st_txstatus_error>),        //                                  .error
		.mac10g_csr_address                     (<connected-to-mac10g_csr_address>),                     //                        mac10g_csr.address
		.mac10g_csr_waitrequest                 (<connected-to-mac10g_csr_waitrequest>),                 //                                  .waitrequest
		.mac10g_csr_read                        (<connected-to-mac10g_csr_read>),                        //                                  .read
		.mac10g_csr_readdata                    (<connected-to-mac10g_csr_readdata>),                    //                                  .readdata
		.mac10g_csr_write                       (<connected-to-mac10g_csr_write>),                       //                                  .write
		.mac10g_csr_writedata                   (<connected-to-mac10g_csr_writedata>),                   //                                  .writedata
		.mac10g_link_fault_status_xgmii_rx_data (<connected-to-mac10g_link_fault_status_xgmii_rx_data>), // mac10g_link_fault_status_xgmii_rx.data
		.mac10g_xgmii_rx_data                   (<connected-to-mac10g_xgmii_rx_data>),                   //                   mac10g_xgmii_rx.data
		.mac10g_xgmii_tx_data                   (<connected-to-mac10g_xgmii_tx_data>),                   //                   mac10g_xgmii_tx.data
		.rst_in_reset_reset                     (<connected-to-rst_in_reset_reset>),                     //                      rst_in_reset.reset
		.rx_st_fifo_out_data                    (<connected-to-rx_st_fifo_out_data>),                    //                    rx_st_fifo_out.data
		.rx_st_fifo_out_valid                   (<connected-to-rx_st_fifo_out_valid>),                   //                                  .valid
		.rx_st_fifo_out_ready                   (<connected-to-rx_st_fifo_out_ready>),                   //                                  .ready
		.rx_st_fifo_out_startofpacket           (<connected-to-rx_st_fifo_out_startofpacket>),           //                                  .startofpacket
		.rx_st_fifo_out_endofpacket             (<connected-to-rx_st_fifo_out_endofpacket>),             //                                  .endofpacket
		.rx_st_fifo_out_empty                   (<connected-to-rx_st_fifo_out_empty>),                   //                                  .empty
		.rx_st_fifo_out_error                   (<connected-to-rx_st_fifo_out_error>),                   //                                  .error
		.tx_st_fifo_in_data                     (<connected-to-tx_st_fifo_in_data>),                     //                     tx_st_fifo_in.data
		.tx_st_fifo_in_valid                    (<connected-to-tx_st_fifo_in_valid>),                    //                                  .valid
		.tx_st_fifo_in_ready                    (<connected-to-tx_st_fifo_in_ready>),                    //                                  .ready
		.tx_st_fifo_in_startofpacket            (<connected-to-tx_st_fifo_in_startofpacket>),            //                                  .startofpacket
		.tx_st_fifo_in_endofpacket              (<connected-to-tx_st_fifo_in_endofpacket>),              //                                  .endofpacket
		.tx_st_fifo_in_empty                    (<connected-to-tx_st_fifo_in_empty>),                    //                                  .empty
		.tx_st_fifo_in_error                    (<connected-to-tx_st_fifo_in_error>)                     //                                  .error
	);

