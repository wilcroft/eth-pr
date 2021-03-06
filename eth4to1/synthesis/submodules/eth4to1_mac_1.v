// eth4to1_mac_1.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module eth4to1_mac_1 (
		input  wire        clk_156_in_clk_clk,                     //                    clk_156_in_clk.clk
		input  wire        clk_312_in_clk_clk,                     //                    clk_312_in_clk.clk
		input  wire [1:0]  mac10g_avalon_st_pause_data,            //            mac10g_avalon_st_pause.data
		output wire        mac10g_avalon_st_rxstatus_valid,        //         mac10g_avalon_st_rxstatus.valid
		output wire [39:0] mac10g_avalon_st_rxstatus_data,         //                                  .data
		output wire [6:0]  mac10g_avalon_st_rxstatus_error,        //                                  .error
		output wire [39:0] mac10g_avalon_st_txstatus_data,         //         mac10g_avalon_st_txstatus.data
		output wire        mac10g_avalon_st_txstatus_valid,        //                                  .valid
		output wire [6:0]  mac10g_avalon_st_txstatus_error,        //                                  .error
		input  wire [12:0] mac10g_csr_address,                     //                        mac10g_csr.address
		output wire        mac10g_csr_waitrequest,                 //                                  .waitrequest
		input  wire        mac10g_csr_read,                        //                                  .read
		output wire [31:0] mac10g_csr_readdata,                    //                                  .readdata
		input  wire        mac10g_csr_write,                       //                                  .write
		input  wire [31:0] mac10g_csr_writedata,                   //                                  .writedata
		output wire [1:0]  mac10g_link_fault_status_xgmii_rx_data, // mac10g_link_fault_status_xgmii_rx.data
		input  wire [71:0] mac10g_xgmii_rx_data,                   //                   mac10g_xgmii_rx.data
		output wire [71:0] mac10g_xgmii_tx_data,                   //                   mac10g_xgmii_tx.data
		input  wire        rst_in_reset_reset,                     //                      rst_in_reset.reset
		output wire [63:0] rx_st_fifo_out_data,                    //                    rx_st_fifo_out.data
		output wire        rx_st_fifo_out_valid,                   //                                  .valid
		input  wire        rx_st_fifo_out_ready,                   //                                  .ready
		output wire        rx_st_fifo_out_startofpacket,           //                                  .startofpacket
		output wire        rx_st_fifo_out_endofpacket,             //                                  .endofpacket
		output wire [2:0]  rx_st_fifo_out_empty,                   //                                  .empty
		output wire [5:0]  rx_st_fifo_out_error,                   //                                  .error
		input  wire [63:0] tx_st_fifo_in_data,                     //                     tx_st_fifo_in.data
		input  wire        tx_st_fifo_in_valid,                    //                                  .valid
		output wire        tx_st_fifo_in_ready,                    //                                  .ready
		input  wire        tx_st_fifo_in_startofpacket,            //                                  .startofpacket
		input  wire        tx_st_fifo_in_endofpacket,              //                                  .endofpacket
		input  wire [2:0]  tx_st_fifo_in_empty,                    //                                  .empty
		input  wire [0:0]  tx_st_fifo_in_error                     //                                  .error
	);

	wire         mac10g_avalon_st_rx_valid;         // mac10g:avalon_st_rx_valid -> rx_st_fifo:in_valid
	wire  [63:0] mac10g_avalon_st_rx_data;          // mac10g:avalon_st_rx_data -> rx_st_fifo:in_data
	wire         mac10g_avalon_st_rx_ready;         // rx_st_fifo:in_ready -> mac10g:avalon_st_rx_ready
	wire         mac10g_avalon_st_rx_startofpacket; // mac10g:avalon_st_rx_startofpacket -> rx_st_fifo:in_startofpacket
	wire         mac10g_avalon_st_rx_endofpacket;   // mac10g:avalon_st_rx_endofpacket -> rx_st_fifo:in_endofpacket
	wire   [5:0] mac10g_avalon_st_rx_error;         // mac10g:avalon_st_rx_error -> rx_st_fifo:in_error
	wire   [2:0] mac10g_avalon_st_rx_empty;         // mac10g:avalon_st_rx_empty -> rx_st_fifo:in_empty
	wire         tx_st_fifo_out_valid;              // tx_st_fifo:out_valid -> mac10g:avalon_st_tx_valid
	wire  [63:0] tx_st_fifo_out_data;               // tx_st_fifo:out_data -> mac10g:avalon_st_tx_data
	wire         tx_st_fifo_out_ready;              // mac10g:avalon_st_tx_ready -> tx_st_fifo:out_ready
	wire         tx_st_fifo_out_startofpacket;      // tx_st_fifo:out_startofpacket -> mac10g:avalon_st_tx_startofpacket
	wire         tx_st_fifo_out_endofpacket;        // tx_st_fifo:out_endofpacket -> mac10g:avalon_st_tx_endofpacket
	wire   [0:0] tx_st_fifo_out_error;              // tx_st_fifo:out_error -> mac10g:avalon_st_tx_error
	wire   [2:0] tx_st_fifo_out_empty;              // tx_st_fifo:out_empty -> mac10g:avalon_st_tx_empty
	wire         rst_controller_reset_out_reset;    // rst_controller:reset_out -> [rx_st_fifo:out_reset_n, tx_st_fifo:in_reset_n]

	eth4to1_mac_0_mac10g mac10g (
		.csr_clk_clk                     (clk_156_in_clk_clk),                     //                    csr_clk.clk
		.csr_reset_reset_n               (~rst_in_reset_reset),                    //                  csr_reset.reset_n
		.csr_address                     (mac10g_csr_address),                     //                        csr.address
		.csr_waitrequest                 (mac10g_csr_waitrequest),                 //                           .waitrequest
		.csr_read                        (mac10g_csr_read),                        //                           .read
		.csr_readdata                    (mac10g_csr_readdata),                    //                           .readdata
		.csr_write                       (mac10g_csr_write),                       //                           .write
		.csr_writedata                   (mac10g_csr_writedata),                   //                           .writedata
		.tx_clk_clk                      (clk_156_in_clk_clk),                     //                     tx_clk.clk
		.tx_reset_reset_n                (~rst_in_reset_reset),                    //                   tx_reset.reset_n
		.avalon_st_tx_startofpacket      (tx_st_fifo_out_startofpacket),           //               avalon_st_tx.startofpacket
		.avalon_st_tx_valid              (tx_st_fifo_out_valid),                   //                           .valid
		.avalon_st_tx_data               (tx_st_fifo_out_data),                    //                           .data
		.avalon_st_tx_empty              (tx_st_fifo_out_empty),                   //                           .empty
		.avalon_st_tx_ready              (tx_st_fifo_out_ready),                   //                           .ready
		.avalon_st_tx_error              (tx_st_fifo_out_error),                   //                           .error
		.avalon_st_tx_endofpacket        (tx_st_fifo_out_endofpacket),             //                           .endofpacket
		.avalon_st_pause_data            (mac10g_avalon_st_pause_data),            //            avalon_st_pause.data
		.xgmii_tx_data                   (mac10g_xgmii_tx_data),                   //                   xgmii_tx.data
		.avalon_st_txstatus_data         (mac10g_avalon_st_txstatus_data),         //         avalon_st_txstatus.data
		.avalon_st_txstatus_valid        (mac10g_avalon_st_txstatus_valid),        //                           .valid
		.avalon_st_txstatus_error        (mac10g_avalon_st_txstatus_error),        //                           .error
		.rx_clk_clk                      (clk_156_in_clk_clk),                     //                     rx_clk.clk
		.rx_reset_reset_n                (~rst_in_reset_reset),                    //                   rx_reset.reset_n
		.xgmii_rx_data                   (mac10g_xgmii_rx_data),                   //                   xgmii_rx.data
		.avalon_st_rx_startofpacket      (mac10g_avalon_st_rx_startofpacket),      //               avalon_st_rx.startofpacket
		.avalon_st_rx_endofpacket        (mac10g_avalon_st_rx_endofpacket),        //                           .endofpacket
		.avalon_st_rx_valid              (mac10g_avalon_st_rx_valid),              //                           .valid
		.avalon_st_rx_ready              (mac10g_avalon_st_rx_ready),              //                           .ready
		.avalon_st_rx_data               (mac10g_avalon_st_rx_data),               //                           .data
		.avalon_st_rx_empty              (mac10g_avalon_st_rx_empty),              //                           .empty
		.avalon_st_rx_error              (mac10g_avalon_st_rx_error),              //                           .error
		.avalon_st_rxstatus_valid        (mac10g_avalon_st_rxstatus_valid),        //         avalon_st_rxstatus.valid
		.avalon_st_rxstatus_data         (mac10g_avalon_st_rxstatus_data),         //                           .data
		.avalon_st_rxstatus_error        (mac10g_avalon_st_rxstatus_error),        //                           .error
		.link_fault_status_xgmii_rx_data (mac10g_link_fault_status_xgmii_rx_data)  // link_fault_status_xgmii_rx.data
	);

	altera_avalon_dc_fifo #(
		.SYMBOLS_PER_BEAT   (8),
		.BITS_PER_SYMBOL    (8),
		.FIFO_DEPTH         (16),
		.CHANNEL_WIDTH      (0),
		.ERROR_WIDTH        (6),
		.USE_PACKETS        (1),
		.USE_IN_FILL_LEVEL  (0),
		.USE_OUT_FILL_LEVEL (0),
		.WR_SYNC_DEPTH      (3),
		.RD_SYNC_DEPTH      (3)
	) rx_st_fifo (
		.in_clk            (clk_156_in_clk_clk),                   //        in_clk.clk
		.in_reset_n        (~rst_in_reset_reset),                  //  in_clk_reset.reset_n
		.out_clk           (clk_312_in_clk_clk),                   //       out_clk.clk
		.out_reset_n       (~rst_controller_reset_out_reset),      // out_clk_reset.reset_n
		.in_data           (mac10g_avalon_st_rx_data),             //            in.data
		.in_valid          (mac10g_avalon_st_rx_valid),            //              .valid
		.in_ready          (mac10g_avalon_st_rx_ready),            //              .ready
		.in_startofpacket  (mac10g_avalon_st_rx_startofpacket),    //              .startofpacket
		.in_endofpacket    (mac10g_avalon_st_rx_endofpacket),      //              .endofpacket
		.in_empty          (mac10g_avalon_st_rx_empty),            //              .empty
		.in_error          (mac10g_avalon_st_rx_error),            //              .error
		.out_data          (rx_st_fifo_out_data),                  //           out.data
		.out_valid         (rx_st_fifo_out_valid),                 //              .valid
		.out_ready         (rx_st_fifo_out_ready),                 //              .ready
		.out_startofpacket (rx_st_fifo_out_startofpacket),         //              .startofpacket
		.out_endofpacket   (rx_st_fifo_out_endofpacket),           //              .endofpacket
		.out_empty         (rx_st_fifo_out_empty),                 //              .empty
		.out_error         (rx_st_fifo_out_error),                 //              .error
		.in_csr_address    (1'b0),                                 //   (terminated)
		.in_csr_read       (1'b0),                                 //   (terminated)
		.in_csr_write      (1'b0),                                 //   (terminated)
		.in_csr_readdata   (),                                     //   (terminated)
		.in_csr_writedata  (32'b00000000000000000000000000000000), //   (terminated)
		.out_csr_address   (1'b0),                                 //   (terminated)
		.out_csr_read      (1'b0),                                 //   (terminated)
		.out_csr_write     (1'b0),                                 //   (terminated)
		.out_csr_readdata  (),                                     //   (terminated)
		.out_csr_writedata (32'b00000000000000000000000000000000), //   (terminated)
		.in_channel        (1'b0),                                 //   (terminated)
		.out_channel       (),                                     //   (terminated)
		.space_avail_data  ()                                      //   (terminated)
	);

	altera_avalon_dc_fifo #(
		.SYMBOLS_PER_BEAT   (8),
		.BITS_PER_SYMBOL    (8),
		.FIFO_DEPTH         (16),
		.CHANNEL_WIDTH      (0),
		.ERROR_WIDTH        (1),
		.USE_PACKETS        (1),
		.USE_IN_FILL_LEVEL  (0),
		.USE_OUT_FILL_LEVEL (0),
		.WR_SYNC_DEPTH      (3),
		.RD_SYNC_DEPTH      (3)
	) tx_st_fifo (
		.in_clk            (clk_312_in_clk_clk),                   //        in_clk.clk
		.in_reset_n        (~rst_controller_reset_out_reset),      //  in_clk_reset.reset_n
		.out_clk           (clk_156_in_clk_clk),                   //       out_clk.clk
		.out_reset_n       (~rst_in_reset_reset),                  // out_clk_reset.reset_n
		.in_data           (tx_st_fifo_in_data),                   //            in.data
		.in_valid          (tx_st_fifo_in_valid),                  //              .valid
		.in_ready          (tx_st_fifo_in_ready),                  //              .ready
		.in_startofpacket  (tx_st_fifo_in_startofpacket),          //              .startofpacket
		.in_endofpacket    (tx_st_fifo_in_endofpacket),            //              .endofpacket
		.in_empty          (tx_st_fifo_in_empty),                  //              .empty
		.in_error          (tx_st_fifo_in_error),                  //              .error
		.out_data          (tx_st_fifo_out_data),                  //           out.data
		.out_valid         (tx_st_fifo_out_valid),                 //              .valid
		.out_ready         (tx_st_fifo_out_ready),                 //              .ready
		.out_startofpacket (tx_st_fifo_out_startofpacket),         //              .startofpacket
		.out_endofpacket   (tx_st_fifo_out_endofpacket),           //              .endofpacket
		.out_empty         (tx_st_fifo_out_empty),                 //              .empty
		.out_error         (tx_st_fifo_out_error),                 //              .error
		.in_csr_address    (1'b0),                                 //   (terminated)
		.in_csr_read       (1'b0),                                 //   (terminated)
		.in_csr_write      (1'b0),                                 //   (terminated)
		.in_csr_readdata   (),                                     //   (terminated)
		.in_csr_writedata  (32'b00000000000000000000000000000000), //   (terminated)
		.out_csr_address   (1'b0),                                 //   (terminated)
		.out_csr_read      (1'b0),                                 //   (terminated)
		.out_csr_write     (1'b0),                                 //   (terminated)
		.out_csr_readdata  (),                                     //   (terminated)
		.out_csr_writedata (32'b00000000000000000000000000000000), //   (terminated)
		.in_channel        (1'b0),                                 //   (terminated)
		.out_channel       (),                                     //   (terminated)
		.space_avail_data  ()                                      //   (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (rst_in_reset_reset),             // reset_in0.reset
		.clk            (clk_312_in_clk_clk),             //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
