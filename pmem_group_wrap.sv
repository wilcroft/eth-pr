module pmem_group_wrap (
		input clock,
		input reset,
		
		// Data arriving from interfaces
		input [63:0] packetin_0_data,
		input packetin_0_valid,
		input packetin_0_sop,
		input packetin_0_eop,
		input [2:0] packetin_0_empty,
		output packetin_0_ready,
		input [63:0] packetin_1_data,
		input packetin_1_valid,
		input packetin_1_sop,
		input packetin_1_eop,
		input [2:0] packetin_1_empty,
		output packetin_1_ready,
		input [63:0] packetin_2_data,
		input packetin_2_valid,
		input packetin_2_sop,
		input packetin_2_eop,
		input [2:0] packetin_2_empty,
		output packetin_2_ready,
		input [63:0] packetin_3_data,
		input packetin_3_valid,
		input packetin_3_sop,
		input packetin_3_eop,
		input [2:0] packetin_3_empty,
		output packetin_3_ready,
		
		// Passthrough of packetin, but with tag information
		output [73:0] packetout_0_data,
		output packetout_0_valid,
		output packetout_0_sop,
		output packetout_0_eop,
		input packetout_0_ready,
		output [73:0] packetout_1_data,
		output packetout_1_valid,
		output packetout_1_sop,
		output packetout_1_eop,
		input packetout_1_ready,
		output [73:0] packetout_2_data,
		output packetout_2_valid,
		output packetout_2_sop,
		output packetout_2_eop,
		input packetout_2_ready,
		output [73:0] packetout_3_data,
		output packetout_3_valid,
		output packetout_3_sop,
		output packetout_3_eop,
		input packetout_3_ready,
		
		// Output data
		output [63:0] transmitout_0_data,
		output transmitout_0_valid,
		output transmitout_0_sop,
		output transmitout_0_eop,
		output [2:0] transmitout_0_empty,
		input transmitout_0_ready,
		output [63:0] transmitout_1_data,
		output transmitout_1_valid,
		output transmitout_1_sop,
		output transmitout_1_eop,
		output [2:0] transmitout_1_empty,
		input transmitout_1_ready,
		output [63:0] transmitout_2_data,
		output transmitout_2_valid,
		output transmitout_2_sop,
		output transmitout_2_eop,
		output [2:0] transmitout_2_empty,
		input transmitout_2_ready,
		output [63:0] transmitout_3_data,
		output transmitout_3_valid,
		output transmitout_3_sop,
		output transmitout_3_eop,
		output [2:0] transmitout_3_empty,
		input transmitout_3_ready,
		
		// Match results
		input [13:0] tagin_data,
		input tagin_valid,
		output tagin_ready
);
		
		// Data arriving from interfaces
		wire [63:0] packetin_data [3:0];
		wire packetin_valid [3:0];
		wire packetin_sop [3:0];
		wire packetin_eop [3:0];
		wire packetin_ready [3:0];
		wire [2:0] packetin_empty [3:0];
		
		// Passthrough of packetin; but with tag information
		wire [73:0] packetout_data [3:0];
		wire packetout_valid [3:0];
		wire packetout_sop [3:0];
		wire packetout_eop [3:0];
		wire packetout_ready [3:0];
		
		// Output data
		wire [63:0] transmitout_data [3:0];
		wire transmitout_valid [3:0];
		wire transmitout_sop [3:0];
		wire transmitout_eop [3:0];
		wire [2:0] transmitout_empty [3:0];
		wire transmitout_ready [3:0];
		
		pmem_group_v2 U0 (.*);
		
		assign packetin_data[0] = packetin_0_data;
		assign packetin_valid[0] = packetin_0_valid;
		assign packetin_sop[0] = packetin_0_sop;
		assign packetin_eop[0] = packetin_0_eop;
		assign packetin_empty[0] = packetin_0_empty;
		assign packetin_0_ready = packetin_ready[0];
		assign packetin_data[1] = packetin_1_data;
		assign packetin_valid[1] = packetin_1_valid;
		assign packetin_sop[1] = packetin_1_sop;
		assign packetin_eop[1] = packetin_1_eop;
		assign packetin_empty[1] = packetin_1_empty;
		assign packetin_1_ready = packetin_ready[1];
		assign packetin_data[2] = packetin_2_data;
		assign packetin_valid[2] = packetin_2_valid;
		assign packetin_sop[2] = packetin_2_sop;
		assign packetin_eop[2] = packetin_2_eop;
		assign packetin_empty[2] = packetin_2_empty;
		assign packetin_2_ready = packetin_ready[2];
		assign packetin_data[3] = packetin_3_data;
		assign packetin_valid[3] = packetin_3_valid;
		assign packetin_sop[3] = packetin_3_sop;
		assign packetin_eop[3] = packetin_3_eop;
		assign packetin_empty[3] = packetin_3_empty;
		assign packetin_3_ready = packetin_ready[3];
		
		// packetout
		assign packetout_0_data = packetout_data[0];
		assign packetout_0_valid = packetout_valid[0];
		assign packetout_0_sop = packetout_sop[0];
		assign packetout_0_eop = packetout_eop[0];
		assign packetout_ready[0] = packetout_0_ready;
		assign packetout_1_data = packetout_data[1];
		assign packetout_1_valid = packetout_valid[1];
		assign packetout_1_sop = packetout_sop[1];
		assign packetout_1_eop = packetout_eop[1];
		assign packetout_ready[1] = packetout_1_ready;
		assign packetout_2_data = packetout_data[2];
		assign packetout_2_valid = packetout_valid[2];
		assign packetout_2_sop = packetout_sop[2];
		assign packetout_2_eop = packetout_eop[2];
		assign packetout_ready[2] = packetout_2_ready;
		assign packetout_3_data = packetout_data[3];
		assign packetout_3_valid = packetout_valid[3];
		assign packetout_3_sop = packetout_sop[3];
		assign packetout_3_eop = packetout_eop[3];
		assign packetout_ready[3] = packetout_3_ready;
		
		// transmitout
		assign transmitout_0_data = transmitout_data[0];
		assign transmitout_0_valid = transmitout_valid[0];
		assign transmitout_0_sop = transmitout_sop[0];
		assign transmitout_0_eop = transmitout_eop[0];
		assign transmitout_0_empty = transmitout_empty[0];
		assign transmitout_ready[0] = transmitout_0_ready;
		assign transmitout_1_data = transmitout_data[1];
		assign transmitout_1_valid = transmitout_valid[1];
		assign transmitout_1_sop = transmitout_sop[1];
		assign transmitout_1_eop = transmitout_eop[1];
		assign transmitout_1_empty = transmitout_empty[1];
		assign transmitout_ready[1] = transmitout_1_ready;
		assign transmitout_2_data = transmitout_data[2];
		assign transmitout_2_valid = transmitout_valid[2];
		assign transmitout_2_sop = transmitout_sop[2];
		assign transmitout_2_eop = transmitout_eop[2];
		assign transmitout_2_empty = transmitout_empty[2];
		assign transmitout_ready[2] = transmitout_2_ready;
		assign transmitout_3_data = transmitout_data[3];
		assign transmitout_3_valid = transmitout_valid[3];
		assign transmitout_3_sop = transmitout_sop[3];
		assign transmitout_3_eop = transmitout_eop[3];
		assign transmitout_3_empty = transmitout_empty[3];
		assign transmitout_ready[3] = transmitout_3_ready;
		
endmodule
