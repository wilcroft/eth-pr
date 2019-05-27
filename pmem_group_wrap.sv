module pmem_group_wrap (
		input clock,
		input reset,
		
		// Data arriving from interfaces
		input [63:0] packetin_0_data,
		input packetin_0_valid,
		input packetin_0_sop,
		input packetin_0_eop,
		output packetin_0_ready,
		input [63:0] packetin_1_data,
		input packetin_1_valid,
		input packetin_1_sop,
		input packetin_1_eop,
		output packetin_1_ready,
		input [63:0] packetin_2_data,
		input packetin_2_valid,
		input packetin_2_sop,
		input packetin_2_eop,
		output packetin_2_ready,
		input [63:0] packetin_3_data,
		input packetin_3_valid,
		input packetin_3_sop,
		input packetin_3_eop,
		output packetin_3_ready,
		
		// Passthrough of packetin, but with tag information
		output [63:0] packetout_0_data,
		output packetout_0_valid,
		output packetout_0_sop,
		output packetout_0_eop,
		input packetout_0_ready,
		output [5:0] packetout_0_channel,
		output [63:0] packetout_1_data,
		output packetout_1_valid,
		output packetout_1_sop,
		output packetout_1_eop,
		input packetout_1_ready,
		output [5:0] packetout_1_channel,
		output [63:0] packetout_2_data,
		output packetout_2_valid,
		output packetout_2_sop,
		output packetout_2_eop,
		input packetout_2_ready,
		output [5:0] packetout_2_channel,
		output [63:0] packetout_3_data,
		output packetout_3_valid,
		output packetout_3_sop,
		output packetout_3_eop,
		input packetout_3_ready,
		output [5:0] packetout_3_channel,
		
		// Output data
		output [63:0] transmitout_0_data,
		output transmitout_0_valid,
		output transmitout_0_sop,
		output transmitout_0_eop,
		input transmitout_0_ready,
		output [63:0] transmitout_1_data,
		output transmitout_1_valid,
		output transmitout_1_sop,
		output transmitout_1_eop,
		input transmitout_1_ready,
		output [63:0] transmitout_2_data,
		output transmitout_2_valid,
		output transmitout_2_sop,
		output transmitout_2_eop,
		input transmitout_2_ready,
		output [63:0] transmitout_3_data,
		output transmitout_3_valid,
		output transmitout_3_sop,
		output transmitout_3_eop,
		input transmitout_3_ready,
		
		// Match results
		input [9:0] tagin_data,
		input tagin_valid,
		output tagin_ready
);
		
		// Data arriving from interfaces
		wire [63:0] packetin_data [3:0];
		wire packetin_valid [3:0];
		wire packetin_sop [3:0];
		wire packetin_eop [3:0];
		wire packetin_ready [3:0];
		
		// Passthrough of packetin; but with tag information
		wire [63:0] packetout_data [3:0];
		wire packetout_valid [3:0];
		wire packetout_sop [3:0];
		wire packetout_eop [3:0];
		wire packetout_ready [3:0];
		wire [5:0] packetout_channel [3:0];
		
		// Output data
		wire [63:0] transmitout_data [3:0];
		wire transmitout_valid [3:0];
		wire transmitout_sop [3:0];
		wire transmitout_eop [3:0];
		wire transmitout_ready [3:0];
		
		pmem_group U0 (.*);
		
		assign packetin_data[0] = packetin_0_data;
		assign packetin_valid[0] = packetin_0_valid;
		assign packetin_sop[0] = packetin_0_sop;
		assign packetin_eop[0] = packetin_0_eop;
		assign packetin_0_ready = packetin_ready[0];
		assign packetin_data[1] = packetin_1_data;
		assign packetin_valid[1] = packetin_1_valid;
		assign packetin_sop[1] = packetin_1_sop;
		assign packetin_eop[1] = packetin_1_eop;
		assign packetin_1_ready = packetin_ready[1];
		assign packetin_data[2] = packetin_2_data;
		assign packetin_valid[2] = packetin_2_valid;
		assign packetin_sop[2] = packetin_2_sop;
		assign packetin_eop[2] = packetin_2_eop;
		assign packetin_2_ready = packetin_ready[2];
		assign packetin_data[3] = packetin_3_data;
		assign packetin_valid[3] = packetin_3_valid;
		assign packetin_sop[3] = packetin_3_sop;
		assign packetin_eop[3] = packetin_3_eop;
		assign packetin_3_ready = packetin_ready[3];
		
		// packetout
		assign packetout_0_data = packetout_data[0];
		assign packetout_0_valid = packetout_valid[0];
		assign packetout_0_sop = packetout_sop[0];
		assign packetout_0_eop = packetout_eop[0];
		assign packetout_ready[0] = packetout_0_ready;
		assign packetout_0_channel = packetout_channel[0];
		assign packetout_1_data = packetout_data[1];
		assign packetout_1_valid = packetout_valid[1];
		assign packetout_1_sop = packetout_sop[1];
		assign packetout_1_eop = packetout_eop[1];
		assign packetout_ready[1] = packetout_1_ready;
		assign packetout_1_channel = packetout_channel[1];
		assign packetout_2_data = packetout_data[2];
		assign packetout_2_valid = packetout_valid[2];
		assign packetout_2_sop = packetout_sop[2];
		assign packetout_2_eop = packetout_eop[2];
		assign packetout_ready[2] = packetout_2_ready;
		assign packetout_2_channel = packetout_channel[2];
		assign packetout_3_data = packetout_data[3];
		assign packetout_3_valid = packetout_valid[3];
		assign packetout_3_sop = packetout_sop[3];
		assign packetout_3_eop = packetout_eop[3];
		assign packetout_ready[3] = packetout_3_ready;
		assign packetout_3_channel = packetout_channel[3];
		
		// transmitout
		assign transmitout_0_data = transmitout_data[0];
		assign transmitout_0_valid = transmitout_valid[0];
		assign transmitout_0_sop = transmitout_sop[0];
		assign transmitout_0_eop = transmitout_eop[0];
		assign transmitout_ready[0] = transmitout_0_ready;
		assign transmitout_1_data = transmitout_data[1];
		assign transmitout_1_valid = transmitout_valid[1];
		assign transmitout_1_sop = transmitout_sop[1];
		assign transmitout_1_eop = transmitout_eop[1];
		assign transmitout_ready[1] = transmitout_1_ready;
		assign transmitout_2_data = transmitout_data[2];
		assign transmitout_2_valid = transmitout_valid[2];
		assign transmitout_2_sop = transmitout_sop[2];
		assign transmitout_2_eop = transmitout_eop[2];
		assign transmitout_ready[2] = transmitout_2_ready;
		assign transmitout_3_data = transmitout_data[3];
		assign transmitout_3_valid = transmitout_valid[3];
		assign transmitout_3_sop = transmitout_sop[3];
		assign transmitout_3_eop = transmitout_eop[3];
		assign transmitout_ready[3] = transmitout_3_ready;
		
endmodule
