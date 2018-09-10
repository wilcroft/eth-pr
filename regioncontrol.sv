module regioncontrol #(parameter REGIONDEFAULT= 8'b00000011) (
	input clk,
	input reset,
	input [2:0] avs_enable_address,
	input avs_enable_write,
	input avs_enable_read,
	input [31:0] avs_enable_writedata,
	output reg [31:0] avs_enable_readdata,
	input [0:0] avs_prcontrol_address,
	input avs_prcontrol_write,
	input avs_prcontrol_read,
	input [31:0] avs_prcontrol_writedata,
	output reg [31:0] avs_prcontrol_readdata,
	
	output reg [7:0] coe_region_enable,
	output reg [7:0] coe_region_freeze
);

		always@ (posedge clk) begin
			if (reset) begin
				coe_region_enable <= REGIONDEFAULT;
				coe_region_freeze <= 0;
			end
			else begin
				if (avs_enable_write)
					coe_region_enable[avs_enable_address] <= avs_enable_writedata[0];
				if (avs_prcontrol_write)
					coe_region_freeze  <= avs_prcontrol_writedata;
			end
		end
		
		always@* begin
			avs_enable_readdata = 0;
			avs_prcontrol_readdata = 0;
			if (avs_enable_read)
				avs_enable_readdata = {31'd0, coe_region_enable[avs_enable_address]};
			if (avs_prcontrol_read)
				avs_prcontrol_readdata = {24'd0, coe_region_freeze};
		end
	
endmodule
	