module sys_top (
inout				FAN_CTRL,
input	[0:0]		BUTTON,
input				OSC_50_B3B, /*
input				OSC_50_B3D,
input				OSC_50_B4A,
input				OSC_50_B4D,
input				OSC_50_B7A,
input				OSC_50_B7D,
input				OSC_50_B8A,
input				OSC_50_B8D,*/
//input				PCIE_PERST_n,
//input				PCIE_REFCLK_p,
//input		[7:0]	PCIE_RX_p,
//output	[7:0]	PCIE_TX_p,
input				SFP_REFCLK_p,
input				SFPA_RX_p,
output			SFPA_TX_p,
input				SFPB_RX_p,
output			SFPB_TX_p,
input				SFPC_RX_p,
output			SFPC_TX_p,
input				SFPD_RX_p,
output			SFPD_TX_p
);

wire xgmii_rx_clk_clk;
wire reset;
wire clk312;

wire [71:0] xgmii_rx_data [3:0];
wire [71:0] xgmii_tx_data [3:0];
wire [63:0] stream_data;
wire [7:0] stream_channel;
wire stream_ready, stream_valid, stream_sop, stream_eop;

wire [9:0] tag_data;
wire tag_ready, tag_valid;

parameter ncount = 8;
assign FAN_CTRL = 1;
assign reset = ~BUTTON[0];

mac10g mac10g_inst(
		.pll_ref_clk                     (SFP_REFCLK_p),          //        pll_ref_clk.clk
		.xgmii_rx_clk                    (xgmii_rx_clk_clk),         //       xgmii_rx_clk.clk
		.tx_ready                        (),             //           tx_ready.export
		.xgmii_tx_clk                    (xgmii_rx_clk_clk),         //       xgmii_tx_clk.clk
		.rx_ready                        (),             //           rx_ready.export
		.rx_data_ready                   (),        //      rx_data_ready.export
		.xgmii_rx_dc_0                   (xgmii_rx_data[0]),        //      xgmii_rx_dc_0.data
		.xgmii_tx_dc_0                   (xgmii_tx_data[0]),        //      xgmii_tx_dc_0.data
		.xgmii_rx_dc_1                   (xgmii_rx_data[1]),        //      xgmii_rx_dc_0.data
		.xgmii_tx_dc_1                   (xgmii_tx_data[1]),        //      xgmii_tx_dc_0.data
		.xgmii_rx_dc_2                   (xgmii_rx_data[2]),        //      xgmii_rx_dc_0.data
		.xgmii_tx_dc_2                   (xgmii_tx_data[2]),        //      xgmii_tx_dc_0.data
		.xgmii_rx_dc_3                   (xgmii_rx_data[3]),        //      xgmii_rx_dc_0.data
		.xgmii_tx_dc_3                   (xgmii_tx_data[3]),        //      xgmii_tx_dc_0.data
		.rx_serial_data_0                (SFPA_RX_p),     //   rx_serial_data_0.export
		.tx_serial_data_0                (SFPA_TX_p),     //   tx_serial_data_0.export
		.rx_serial_data_1                (SFPB_RX_p),   
		.tx_serial_data_1                (SFPB_TX_p),    
		.rx_serial_data_2                (SFPC_RX_p),     //   rx_serial_data_0.export
		.tx_serial_data_2                (SFPC_TX_p),     //   tx_serial_data_0.export
		.rx_serial_data_3                (SFPD_RX_p),   
		.tx_serial_data_3                (SFPD_TX_p),    
		.reconfig_from_xcvr              (),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr                (),     //   reconfig_to_xcvr.reconfig_to_xcvr
		.phy_mgmt_clk                    (OSC_50_B3B),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset              (~reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address                (),     //           phy_mgmt.address
		.phy_mgmt_read                   (),        //                   .read
		.phy_mgmt_readdata               (),    //                   .readdata
		.phy_mgmt_write                  (),       //                   .write
		.phy_mgmt_writedata              (),   //                   .writedata
		.phy_mgmt_waitrequest            ()  //                   .waitrequest
	);

	    eth4to1 u0 (
        .clk_clk                     (xgmii_rx_clk_clk),                     //             clk.clk
        .clk_312_out_clk_clk         (clk312),         // clk_312_out_clk.clk
        .eth_in_mux_out_data          (stream_data),          //   eth_outstream.data
        .eth_in_mux_out_ready         (stream_ready),         //                .ready
        .eth_in_mux_out_valid         (stream_valid),         //                .valid
        .eth_in_mux_out_endofpacket   (stream_eop),   //                .endofpacket
        .eth_in_mux_out_startofpacket (stream_sop), //                .startofpacket
        .eth_in_mux_out_channel       (stream_channel),       //                .channel
        .ethpack_tagin_data          (tag_data),          //   eth_tagstream.data
        .ethpack_tagin_ready         (tag_ready),         //                .ready
        .ethpack_tagin_valid         (tag_valid),         //                .valid
        .xgmii_rx_data_0_data        (xgmii_rx_data[0]),        // xgmii_rx_data_0.data
        .xgmii_tx_data_0_data        (xgmii_tx_data[0]),        // xgmii_tx_data_0.data
        .xgmii_rx_data_1_data        (xgmii_rx_data[1]),        // xgmii_rx_data_1.data
        .xgmii_tx_data_1_data        (xgmii_tx_data[1]),        // xgmii_tx_data_1.data
        .xgmii_rx_data_2_data        (xgmii_rx_data[2]),        // xgmii_rx_data_2.data
        .xgmii_tx_data_2_data        (xgmii_tx_data[2]),        // xgmii_tx_data_2.data
        .xgmii_rx_data_3_data        (xgmii_rx_data[3]),        // xgmii_rx_data_3.data
        .xgmii_tx_data_3_data        (xgmii_tx_data[3]),        // xgmii_tx_data_3.data
        .reset_reset_n               (reset)
	);
	
	
	wire pnode_ready [ncount-1:0];
	wire [73:0] pnode_data [ncount-1:0];
	wire pnode_valid [ncount-1:0];

	wire [9:0] pnodeout [ncount-1:0];
	wire pnodeout_valid [ncount-1:0];
	wire pnodeout_ack [ncount-1:0];
	
	in_fifo_network #(.ncount(ncount)) innet (
			.clock(clk312),
			.sclr(!reset),
			.st_data(stream_data),
			.st_sop(stream_sop),
			.st_eop(stream_eop),
			.st_valid(stream_valid),
			.st_ready(stream_ready),
			.st_channel(stream_channel),
			.pnode_ready,
			.pnode_data,
			.pnode_valid
	);
	
	out_fifo_network  #(.ncount(ncount)) outnet  (
			.clock(clk312),
			.sclr(!reset),
			.tag_data(tag_data),
			.tag_valid(tag_valid),
			.tag_ready(tag_ready),
			.dataout(pnodeout) ,
			.data_valid(pnodeout_valid),
			.data_ack(pnodeout_ack)
	);
	
	genvar i;
	
	generate 
		for (i=0; i< ncount; i=i+1) begin : pnode_gen
			hardmatchblock #(.CHOUT(i)) mb (
				.clock(clk312),
				.data_out(pnodeout[i]),
				.data_valid(pnodeout_valid[i]),
				.data_ack(pnodeout_ack[i]),
				.pnode_ready(pnode_ready[i]),
				.pnode_data(pnode_data[i]),
				.pnode_valid(pnode_valid[i])
			);
		end
	endgenerate

endmodule
