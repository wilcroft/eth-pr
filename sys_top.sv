module sys_top (
inout				FAN_CTRL,
input	[1:0]		BUTTON,
input				OSC_50_B3B, /*
input				OSC_50_B3D,
input				OSC_50_B4A,
input				OSC_50_B4D,
input				OSC_50_B7A,
input				OSC_50_B7D,
input				OSC_50_B8A,
input				OSC_50_B8D,*/
output			CLOCK_SCL,
inout				CLOCK_SDA,
input				PCIE_PERST_n,
input				PCIE_REFCLK_p,
input		[7:0]	PCIE_RX_p,
output	[7:0]	PCIE_TX_p,
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
//wire [63:0] stream_data;
wire [127:0] stream_data;
wire [7:0] stream_channel;
wire stream_ready, stream_valid, stream_sop, stream_eop;

wire [9:0] tag_data;
wire tag_ready, tag_valid;

parameter ncount = 8;
assign FAN_CTRL = 1;
assign reset = BUTTON[0];

wire [559:0] reconfig_to_xcvr;
wire [367:0] reconfig_from_xcvr;
wire global_freeze;
wire [7:0] local_freeze;
wire [7:0] local_enable;

wire si_start;
wire clk_125;
wire pll_locked;

si570_controller u1(

.iCLK(OSC_50_B3B), // system   clock 50mhz 
.iRST_n(reset), // system reset
.iStart(si_start), //giving 1 50Mhz cycle high pulse to set frequency
.iFREQ_MODE(3'b110),//clock frequency mode   000:100Mhz, 001: 125Mhz, 010:156.25Mhz, 011:250Mhz, 100:312.5Mhz , 101:322.26Mhz , 110:644.53Mhz ,111:100Mhz 
.I2C_CLK(CLOCK_SCL),
.I2C_DATA(CLOCK_SDA),
.oController_Ready()
);


edge_detector edge_detector(

.iCLK(OSC_50_B3B),
.iRST_n(reset),
.iIn(BUTTON[1]),
.oDEBOUNCE_OUT(si_start)
);


////////////////////////////////////////
// generate clk125 for phy_mgmt

mgmt_pll mgmt_pll_inst(
		.refclk(OSC_50_B3B),   //  refclk.clk
		.rst(1'b0),      //   reset.reset
		.outclk_0(clk_125), // outclk0.clk
		.locked(pll_reset)    //  locked.export
	);



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
		.reconfig_from_xcvr,   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr,     //   reconfig_to_xcvr.reconfig_to_xcvr
		.phy_mgmt_clk                    (OSC_50_B3B),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset              (~reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address                (),     //           phy_mgmt.address
		.phy_mgmt_read                   (),        //                   .read
		.phy_mgmt_readdata               (),    //                   .readdata
		.phy_mgmt_write                  (),       //                   .write
		.phy_mgmt_writedata              (),   //                   .writedata
		.phy_mgmt_waitrequest            ()  //                   .waitrequest
	);
	
	eth_rcfg xcvrrfcg(
		//.reconfig_busy,             //      reconfig_busy.reconfig_busy
		.mgmt_clk_clk(OSC_50_B3B),              //       mgmt_clk_clk.clk
		.mgmt_rst_reset(~reset),            //     mgmt_rst_reset.reset
		//input  wire [6:0]   reconfig_mgmt_address,     //      reconfig_mgmt.address
		//input  wire         reconfig_mgmt_read,        //                   .read
		//output wire [31:0]  reconfig_mgmt_readdata,    //                   .readdata
		//output wire         reconfig_mgmt_waitrequest, //                   .waitrequest
		//input  wire         reconfig_mgmt_write,       //                   .write
		//input  wire [31:0]  reconfig_mgmt_writedata,   //                   .writedata
		.reconfig_to_xcvr,          //   reconfig_to_xcvr.reconfig_to_xcvr
		.reconfig_from_xcvr         // reconfig_from_xcvr.reconfig_from_xcvr
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
        .reset_reset_n               (reset),              
        .ethpack_control_region_enable_export (local_enable), // ethpack_control_region_enable.export
        .ethpack_control_region_freeze_export (local_freeze),                  //                              .ready
        .pcie_clk_in_clk_clk			 (PCIE_REFCLK_p),
		  .pcie_hip_serial_rx_in0               (PCIE_RX_p[0]),               //               pcie_hip_serial.rx_in0
        .pcie_hip_serial_rx_in1               (PCIE_RX_p[1]),               //                              .rx_in1
        .pcie_hip_serial_rx_in2               (PCIE_RX_p[2]),               //                              .rx_in2
        .pcie_hip_serial_rx_in3               (PCIE_RX_p[3]),               //                              .rx_in3
        .pcie_hip_serial_rx_in4               (PCIE_RX_p[4]),               //                              .rx_in4
        .pcie_hip_serial_rx_in5               (PCIE_RX_p[5]),               //                              .rx_in5
        .pcie_hip_serial_rx_in6               (PCIE_RX_p[6]),               //                              .rx_in6
        .pcie_hip_serial_rx_in7               (PCIE_RX_p[7]),               //                              .rx_in7
        .pcie_hip_serial_tx_out0              (PCIE_TX_p[0]),              //                              .tx_out0
        .pcie_hip_serial_tx_out1              (PCIE_TX_p[1]),              //                              .tx_out1
        .pcie_hip_serial_tx_out2              (PCIE_TX_p[2]),              //                              .tx_out2
        .pcie_hip_serial_tx_out3              (PCIE_TX_p[3]),              //                              .tx_out3
        .pcie_hip_serial_tx_out4              (PCIE_TX_p[4]),              //                              .tx_out4
        .pcie_hip_serial_tx_out5              (PCIE_TX_p[5]),              //                              .tx_out5
        .pcie_hip_serial_tx_out6              (PCIE_TX_p[6]),              //                              .tx_out6
        .pcie_hip_serial_tx_out7              (PCIE_TX_p[7]),              //                              .tx_out7
        .pcie_npor_npor                       (1'b1),                       //                     pcie_npor.npor
        .pcie_npor_pin_perst                  (PCIE_PERST_n),                  //                              .pin_perst
		  .pr_freeze_freeze                     (global_freeze)
	);
	
	
	
	wire pnode_ready [ncount-1:0];
	//wire [73:0] pnode_data [ncount-1:0];
	wire [141:0] pnode_data [ncount-1:0];
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
	
	reg [7:0] local_freeze312;
	reg [7:0] local_enable312;
	
	always@(posedge clk312) begin
		local_freeze312 <= local_freeze;
		local_enable312 <= local_enable;
	end
	
	genvar i;
	
	generate 
		for (i=0; i< ncount; i=i+1) begin : pnode_gen
			matchblock_wrapper #(.blocktype(0)) mb (
				.clock(clk312),
				.mask_data_out(pnodeout[i]),
				.mask_data_valid(pnodeout_valid[i]),
				.mask_data_ack(pnodeout_ack[i]),
				.mask_pnode_ready(pnode_ready[i]),
				.mask_pnode_data(pnode_data[i]),
				.mask_pnode_valid(pnode_valid[i]),
				.coe_localfreeze(local_freeze312[i]),
				.coe_enable(local_enable312[i]),
				.coe_globalfreeze(global_freeze)
			);
		end
	endgenerate

endmodule
