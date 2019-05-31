module matchblock_wrapper #(parameter blocktype=0) (
	input clock,
	input reset,
	input avs_update_write,
	input avs_update_read,
	input [31:0] avs_update_writedata,
	output reg [31:0] avs_update_readdata,
	input [0:0] avs_update_address,
	
	input coe_localfreeze,
	input coe_globalfreeze,
	input coe_enable,	
	
	output reg [13:0] mask_data_out,
	output reg mask_data_valid,
	input mask_data_ack,
	
	output reg mask_pnode_ready,
	//input [73:0]mask_pnode_data,
	input [141:0]mask_pnode_data,
	input mask_pnode_valid
	
);
/*
	input [2:0] avs_enable_address,
	input avs_update_write,
	input avs_update_read,
	input [31:0] avs_update_writedata,
	output reg [31:0] avs_update_readdata,
	input [0:0] avs_update_address,*/
	
	wire [13:0] data_out;
	wire data_valid;
	reg data_ack;
	wire pnode_ready;
	reg [141:0]pnode_data;
	reg pnode_valid;
	
	always@* begin
		if (coe_globalfreeze && coe_localfreeze) begin
			mask_data_out = 10'b0;
			mask_pnode_ready = 1'b1;
			mask_data_valid = 1'b0;
			pnode_data = 142'b0;
			data_ack = 1'b0;
			pnode_valid = 1'b0;
		end
		else if (coe_enable) begin
			mask_data_out = data_out;
			mask_pnode_ready = pnode_ready;
			mask_data_valid = data_valid;
			pnode_data = mask_pnode_data;
			data_ack = mask_data_ack;
			pnode_valid = mask_pnode_valid;
		end
		else begin
			mask_data_out = 10'b0;
			mask_pnode_ready = 1'b1;
			mask_data_valid = 1'b0;
			pnode_data = 142'b0;
			data_ack = 1'b0;
			pnode_valid = 1'b0;
		end
	end

	generate 
		if (blocktype==1) begin
			hardmatchblock_128 block_hard(
				.*
			);
		end
		else if (blocktype==2) begin
			memorymatchblock_128 block_mem (
				.match_data_out(data_out),
				.match_data_valid(data_valid),
				.match_data_ack(data_ack),
				.*
			);
		end
	endgenerate


endmodule
