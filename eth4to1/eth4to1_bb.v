
module eth4to1 (
	clk_clk,
	clk_100_clk,
	clk_312_out_clk_clk,
	eth_in_mux_out_data,
	eth_in_mux_out_valid,
	eth_in_mux_out_ready,
	eth_in_mux_out_startofpacket,
	eth_in_mux_out_endofpacket,
	eth_in_mux_out_empty,
	eth_in_mux_out_channel,
	ethpack_tagin_data,
	ethpack_tagin_valid,
	ethpack_tagin_ready,
	pcie_npor_npor,
	pcie_npor_pin_perst,
	reset_reset_n,
	reset_0_reset_n,
	xgmii_rx_data_0_data,
	xgmii_rx_data_1_data,
	xgmii_rx_data_2_data,
	xgmii_rx_data_3_data,
	xgmii_tx_data_0_data,
	xgmii_tx_data_1_data,
	xgmii_tx_data_2_data,
	xgmii_tx_data_3_data,
	pcie_hip_serial_rx_in0,
	pcie_hip_serial_rx_in1,
	pcie_hip_serial_rx_in2,
	pcie_hip_serial_rx_in3,
	pcie_hip_serial_rx_in4,
	pcie_hip_serial_rx_in5,
	pcie_hip_serial_rx_in6,
	pcie_hip_serial_rx_in7,
	pcie_hip_serial_tx_out0,
	pcie_hip_serial_tx_out1,
	pcie_hip_serial_tx_out2,
	pcie_hip_serial_tx_out3,
	pcie_hip_serial_tx_out4,
	pcie_hip_serial_tx_out5,
	pcie_hip_serial_tx_out6,
	pcie_hip_serial_tx_out7,
	pr_freeze_freeze,
	ethpack_control_region_enable_export,
	ethpack_control_region_freeze_export);	

	input		clk_clk;
	input		clk_100_clk;
	output		clk_312_out_clk_clk;
	output	[63:0]	eth_in_mux_out_data;
	output		eth_in_mux_out_valid;
	input		eth_in_mux_out_ready;
	output		eth_in_mux_out_startofpacket;
	output		eth_in_mux_out_endofpacket;
	output	[2:0]	eth_in_mux_out_empty;
	output	[7:0]	eth_in_mux_out_channel;
	input	[9:0]	ethpack_tagin_data;
	input		ethpack_tagin_valid;
	output		ethpack_tagin_ready;
	input		pcie_npor_npor;
	input		pcie_npor_pin_perst;
	input		reset_reset_n;
	input		reset_0_reset_n;
	input	[71:0]	xgmii_rx_data_0_data;
	input	[71:0]	xgmii_rx_data_1_data;
	input	[71:0]	xgmii_rx_data_2_data;
	input	[71:0]	xgmii_rx_data_3_data;
	output	[71:0]	xgmii_tx_data_0_data;
	output	[71:0]	xgmii_tx_data_1_data;
	output	[71:0]	xgmii_tx_data_2_data;
	output	[71:0]	xgmii_tx_data_3_data;
	input		pcie_hip_serial_rx_in0;
	input		pcie_hip_serial_rx_in1;
	input		pcie_hip_serial_rx_in2;
	input		pcie_hip_serial_rx_in3;
	input		pcie_hip_serial_rx_in4;
	input		pcie_hip_serial_rx_in5;
	input		pcie_hip_serial_rx_in6;
	input		pcie_hip_serial_rx_in7;
	output		pcie_hip_serial_tx_out0;
	output		pcie_hip_serial_tx_out1;
	output		pcie_hip_serial_tx_out2;
	output		pcie_hip_serial_tx_out3;
	output		pcie_hip_serial_tx_out4;
	output		pcie_hip_serial_tx_out5;
	output		pcie_hip_serial_tx_out6;
	output		pcie_hip_serial_tx_out7;
	output		pr_freeze_freeze;
	output	[7:0]	ethpack_control_region_enable_export;
	output	[7:0]	ethpack_control_region_freeze_export;
endmodule
