	eth4to1 u0 (
		.clk_clk                              (<connected-to-clk_clk>),                              //                           clk.clk
		.clk_100_clk                          (<connected-to-clk_100_clk>),                          //                       clk_100.clk
		.clk_312_out_clk_clk                  (<connected-to-clk_312_out_clk_clk>),                  //               clk_312_out_clk.clk
		.eth_in_mux_out_data                  (<connected-to-eth_in_mux_out_data>),                  //                eth_in_mux_out.data
		.eth_in_mux_out_valid                 (<connected-to-eth_in_mux_out_valid>),                 //                              .valid
		.eth_in_mux_out_ready                 (<connected-to-eth_in_mux_out_ready>),                 //                              .ready
		.eth_in_mux_out_startofpacket         (<connected-to-eth_in_mux_out_startofpacket>),         //                              .startofpacket
		.eth_in_mux_out_endofpacket           (<connected-to-eth_in_mux_out_endofpacket>),           //                              .endofpacket
		.eth_in_mux_out_empty                 (<connected-to-eth_in_mux_out_empty>),                 //                              .empty
		.eth_in_mux_out_channel               (<connected-to-eth_in_mux_out_channel>),               //                              .channel
		.ethpack_tagin_data                   (<connected-to-ethpack_tagin_data>),                   //                 ethpack_tagin.data
		.ethpack_tagin_valid                  (<connected-to-ethpack_tagin_valid>),                  //                              .valid
		.ethpack_tagin_ready                  (<connected-to-ethpack_tagin_ready>),                  //                              .ready
		.pcie_npor_npor                       (<connected-to-pcie_npor_npor>),                       //                     pcie_npor.npor
		.pcie_npor_pin_perst                  (<connected-to-pcie_npor_pin_perst>),                  //                              .pin_perst
		.reset_reset_n                        (<connected-to-reset_reset_n>),                        //                         reset.reset_n
		.reset_0_reset_n                      (<connected-to-reset_0_reset_n>),                      //                       reset_0.reset_n
		.xgmii_rx_data_0_data                 (<connected-to-xgmii_rx_data_0_data>),                 //               xgmii_rx_data_0.data
		.xgmii_rx_data_1_data                 (<connected-to-xgmii_rx_data_1_data>),                 //               xgmii_rx_data_1.data
		.xgmii_rx_data_2_data                 (<connected-to-xgmii_rx_data_2_data>),                 //               xgmii_rx_data_2.data
		.xgmii_rx_data_3_data                 (<connected-to-xgmii_rx_data_3_data>),                 //               xgmii_rx_data_3.data
		.xgmii_tx_data_0_data                 (<connected-to-xgmii_tx_data_0_data>),                 //               xgmii_tx_data_0.data
		.xgmii_tx_data_1_data                 (<connected-to-xgmii_tx_data_1_data>),                 //               xgmii_tx_data_1.data
		.xgmii_tx_data_2_data                 (<connected-to-xgmii_tx_data_2_data>),                 //               xgmii_tx_data_2.data
		.xgmii_tx_data_3_data                 (<connected-to-xgmii_tx_data_3_data>),                 //               xgmii_tx_data_3.data
		.pcie_hip_serial_rx_in0               (<connected-to-pcie_hip_serial_rx_in0>),               //               pcie_hip_serial.rx_in0
		.pcie_hip_serial_rx_in1               (<connected-to-pcie_hip_serial_rx_in1>),               //                              .rx_in1
		.pcie_hip_serial_rx_in2               (<connected-to-pcie_hip_serial_rx_in2>),               //                              .rx_in2
		.pcie_hip_serial_rx_in3               (<connected-to-pcie_hip_serial_rx_in3>),               //                              .rx_in3
		.pcie_hip_serial_rx_in4               (<connected-to-pcie_hip_serial_rx_in4>),               //                              .rx_in4
		.pcie_hip_serial_rx_in5               (<connected-to-pcie_hip_serial_rx_in5>),               //                              .rx_in5
		.pcie_hip_serial_rx_in6               (<connected-to-pcie_hip_serial_rx_in6>),               //                              .rx_in6
		.pcie_hip_serial_rx_in7               (<connected-to-pcie_hip_serial_rx_in7>),               //                              .rx_in7
		.pcie_hip_serial_tx_out0              (<connected-to-pcie_hip_serial_tx_out0>),              //                              .tx_out0
		.pcie_hip_serial_tx_out1              (<connected-to-pcie_hip_serial_tx_out1>),              //                              .tx_out1
		.pcie_hip_serial_tx_out2              (<connected-to-pcie_hip_serial_tx_out2>),              //                              .tx_out2
		.pcie_hip_serial_tx_out3              (<connected-to-pcie_hip_serial_tx_out3>),              //                              .tx_out3
		.pcie_hip_serial_tx_out4              (<connected-to-pcie_hip_serial_tx_out4>),              //                              .tx_out4
		.pcie_hip_serial_tx_out5              (<connected-to-pcie_hip_serial_tx_out5>),              //                              .tx_out5
		.pcie_hip_serial_tx_out6              (<connected-to-pcie_hip_serial_tx_out6>),              //                              .tx_out6
		.pcie_hip_serial_tx_out7              (<connected-to-pcie_hip_serial_tx_out7>),              //                              .tx_out7
		.pr_freeze_freeze                     (<connected-to-pr_freeze_freeze>),                     //                     pr_freeze.freeze
		.ethpack_control_region_enable_export (<connected-to-ethpack_control_region_enable_export>), // ethpack_control_region_enable.export
		.ethpack_control_region_freeze_export (<connected-to-ethpack_control_region_freeze_export>)  // ethpack_control_region_freeze.export
	);

