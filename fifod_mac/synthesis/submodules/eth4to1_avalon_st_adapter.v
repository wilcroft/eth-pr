// eth4to1_avalon_st_adapter.v

// This file was auto-generated from altera_avalon_st_adapter_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module eth4to1_avalon_st_adapter #(
		parameter inBitsPerSymbol = 8,
		parameter inUsePackets    = 1,
		parameter inDataWidth     = 64,
		parameter inChannelWidth  = 2,
		parameter inErrorWidth    = 6,
		parameter inUseEmptyPort  = 1,
		parameter inUseValid      = 1,
		parameter inUseReady      = 1,
		parameter inReadyLatency  = 0,
		parameter outDataWidth    = 64,
		parameter outChannelWidth = 0,
		parameter outErrorWidth   = 0,
		parameter outUseEmptyPort = 0,
		parameter outUseValid     = 1,
		parameter outUseReady     = 1,
		parameter outReadyLatency = 0
	) (
		input  wire        in_clk_0_clk,        // in_clk_0.clk
		input  wire        in_rst_0_reset,      // in_rst_0.reset
		input  wire [63:0] in_0_data,           //     in_0.data
		input  wire        in_0_valid,          //         .valid
		output wire        in_0_ready,          //         .ready
		input  wire        in_0_startofpacket,  //         .startofpacket
		input  wire        in_0_endofpacket,    //         .endofpacket
		input  wire [2:0]  in_0_empty,          //         .empty
		input  wire [5:0]  in_0_error,          //         .error
		input  wire [1:0]  in_0_channel,        //         .channel
		output wire [63:0] out_0_data,          //    out_0.data
		output wire        out_0_valid,         //         .valid
		input  wire        out_0_ready,         //         .ready
		output wire        out_0_startofpacket, //         .startofpacket
		output wire        out_0_endofpacket    //         .endofpacket
	);

	wire         data_format_adapter_0_out_valid;         // data_format_adapter_0:out_valid -> channel_adapter_0:in_valid
	wire  [63:0] data_format_adapter_0_out_data;          // data_format_adapter_0:out_data -> channel_adapter_0:in_data
	wire         data_format_adapter_0_out_ready;         // channel_adapter_0:in_ready -> data_format_adapter_0:out_ready
	wire   [1:0] data_format_adapter_0_out_channel;       // data_format_adapter_0:out_channel -> channel_adapter_0:in_channel
	wire         data_format_adapter_0_out_startofpacket; // data_format_adapter_0:out_startofpacket -> channel_adapter_0:in_startofpacket
	wire         data_format_adapter_0_out_endofpacket;   // data_format_adapter_0:out_endofpacket -> channel_adapter_0:in_endofpacket
	wire   [5:0] data_format_adapter_0_out_error;         // data_format_adapter_0:out_error -> channel_adapter_0:in_error
	wire         channel_adapter_0_out_valid;             // channel_adapter_0:out_valid -> error_adapter_0:in_valid
	wire  [63:0] channel_adapter_0_out_data;              // channel_adapter_0:out_data -> error_adapter_0:in_data
	wire         channel_adapter_0_out_ready;             // error_adapter_0:in_ready -> channel_adapter_0:out_ready
	wire         channel_adapter_0_out_startofpacket;     // channel_adapter_0:out_startofpacket -> error_adapter_0:in_startofpacket
	wire         channel_adapter_0_out_endofpacket;       // channel_adapter_0:out_endofpacket -> error_adapter_0:in_endofpacket
	wire   [5:0] channel_adapter_0_out_error;             // channel_adapter_0:out_error -> error_adapter_0:in_error

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (inBitsPerSymbol != 8)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inbitspersymbol_check ( .error(1'b1) );
		end
		if (inUsePackets != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inusepackets_check ( .error(1'b1) );
		end
		if (inDataWidth != 64)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					indatawidth_check ( .error(1'b1) );
		end
		if (inChannelWidth != 2)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inchannelwidth_check ( .error(1'b1) );
		end
		if (inErrorWidth != 6)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inerrorwidth_check ( .error(1'b1) );
		end
		if (inUseEmptyPort != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inuseemptyport_check ( .error(1'b1) );
		end
		if (inUseValid != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inusevalid_check ( .error(1'b1) );
		end
		if (inUseReady != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inuseready_check ( .error(1'b1) );
		end
		if (inReadyLatency != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inreadylatency_check ( .error(1'b1) );
		end
		if (outDataWidth != 64)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outdatawidth_check ( .error(1'b1) );
		end
		if (outChannelWidth != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outchannelwidth_check ( .error(1'b1) );
		end
		if (outErrorWidth != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outerrorwidth_check ( .error(1'b1) );
		end
		if (outUseEmptyPort != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outuseemptyport_check ( .error(1'b1) );
		end
		if (outUseValid != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outusevalid_check ( .error(1'b1) );
		end
		if (outUseReady != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outuseready_check ( .error(1'b1) );
		end
		if (outReadyLatency != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outreadylatency_check ( .error(1'b1) );
		end
	endgenerate

	eth4to1_avalon_st_adapter_data_format_adapter_0 data_format_adapter_0 (
		.clk               (in_clk_0_clk),                            //   clk.clk
		.reset_n           (~in_rst_0_reset),                         // reset.reset_n
		.in_data           (in_0_data),                               //    in.data
		.in_valid          (in_0_valid),                              //      .valid
		.in_ready          (in_0_ready),                              //      .ready
		.in_startofpacket  (in_0_startofpacket),                      //      .startofpacket
		.in_endofpacket    (in_0_endofpacket),                        //      .endofpacket
		.in_empty          (in_0_empty),                              //      .empty
		.in_error          (in_0_error),                              //      .error
		.in_channel        (in_0_channel),                            //      .channel
		.out_data          (data_format_adapter_0_out_data),          //   out.data
		.out_valid         (data_format_adapter_0_out_valid),         //      .valid
		.out_ready         (data_format_adapter_0_out_ready),         //      .ready
		.out_startofpacket (data_format_adapter_0_out_startofpacket), //      .startofpacket
		.out_endofpacket   (data_format_adapter_0_out_endofpacket),   //      .endofpacket
		.out_error         (data_format_adapter_0_out_error),         //      .error
		.out_channel       (data_format_adapter_0_out_channel)        //      .channel
	);

	eth4to1_avalon_st_adapter_channel_adapter_0 channel_adapter_0 (
		.clk               (in_clk_0_clk),                            //   clk.clk
		.reset_n           (~in_rst_0_reset),                         // reset.reset_n
		.in_data           (data_format_adapter_0_out_data),          //    in.data
		.in_valid          (data_format_adapter_0_out_valid),         //      .valid
		.in_ready          (data_format_adapter_0_out_ready),         //      .ready
		.in_startofpacket  (data_format_adapter_0_out_startofpacket), //      .startofpacket
		.in_endofpacket    (data_format_adapter_0_out_endofpacket),   //      .endofpacket
		.in_error          (data_format_adapter_0_out_error),         //      .error
		.in_channel        (data_format_adapter_0_out_channel),       //      .channel
		.out_data          (channel_adapter_0_out_data),              //   out.data
		.out_valid         (channel_adapter_0_out_valid),             //      .valid
		.out_ready         (channel_adapter_0_out_ready),             //      .ready
		.out_startofpacket (channel_adapter_0_out_startofpacket),     //      .startofpacket
		.out_endofpacket   (channel_adapter_0_out_endofpacket),       //      .endofpacket
		.out_error         (channel_adapter_0_out_error)              //      .error
	);

	eth4to1_avalon_st_adapter_error_adapter_0 error_adapter_0 (
		.clk               (in_clk_0_clk),                        //   clk.clk
		.reset_n           (~in_rst_0_reset),                     // reset.reset_n
		.in_data           (channel_adapter_0_out_data),          //    in.data
		.in_valid          (channel_adapter_0_out_valid),         //      .valid
		.in_ready          (channel_adapter_0_out_ready),         //      .ready
		.in_startofpacket  (channel_adapter_0_out_startofpacket), //      .startofpacket
		.in_endofpacket    (channel_adapter_0_out_endofpacket),   //      .endofpacket
		.in_error          (channel_adapter_0_out_error),         //      .error
		.out_data          (out_0_data),                          //   out.data
		.out_valid         (out_0_valid),                         //      .valid
		.out_ready         (out_0_ready),                         //      .ready
		.out_startofpacket (out_0_startofpacket),                 //      .startofpacket
		.out_endofpacket   (out_0_endofpacket)                    //      .endofpacket
	);

endmodule
