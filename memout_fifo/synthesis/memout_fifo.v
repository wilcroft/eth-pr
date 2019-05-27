// memout_fifo.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module memout_fifo (
		input  wire        clk_clk,                       //             clk.clk
		input  wire [63:0] memout_fifo_in_data,           //  memout_fifo_in.data
		input  wire        memout_fifo_in_valid,          //                .valid
		output wire        memout_fifo_in_ready,          //                .ready
		input  wire        memout_fifo_in_startofpacket,  //                .startofpacket
		input  wire        memout_fifo_in_endofpacket,    //                .endofpacket
		input  wire [2:0]  memout_fifo_in_empty,          //                .empty
		output wire [63:0] memout_fifo_out_data,          // memout_fifo_out.data
		output wire        memout_fifo_out_valid,         //                .valid
		input  wire        memout_fifo_out_ready,         //                .ready
		output wire        memout_fifo_out_startofpacket, //                .startofpacket
		output wire        memout_fifo_out_endofpacket,   //                .endofpacket
		output wire [2:0]  memout_fifo_out_empty,         //                .empty
		input  wire        reset_reset                    //           reset.reset
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (8),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (4),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) memout_fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (reset_reset),                          // clk_reset.reset
		.in_data           (memout_fifo_in_data),                  //        in.data
		.in_valid          (memout_fifo_in_valid),                 //          .valid
		.in_ready          (memout_fifo_in_ready),                 //          .ready
		.in_startofpacket  (memout_fifo_in_startofpacket),         //          .startofpacket
		.in_endofpacket    (memout_fifo_in_endofpacket),           //          .endofpacket
		.in_empty          (memout_fifo_in_empty),                 //          .empty
		.out_data          (memout_fifo_out_data),                 //       out.data
		.out_valid         (memout_fifo_out_valid),                //          .valid
		.out_ready         (memout_fifo_out_ready),                //          .ready
		.out_startofpacket (memout_fifo_out_startofpacket),        //          .startofpacket
		.out_endofpacket   (memout_fifo_out_endofpacket),          //          .endofpacket
		.out_empty         (memout_fifo_out_empty),                //          .empty
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

endmodule
