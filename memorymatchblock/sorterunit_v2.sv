module sorterunit #(parameter size= 17) (
	input clock,
	input reset,
	input [size-1:0] datain,
	input valid,
	input ready,
	input [size-1:0] prevdata,
	input prevempty_n,
	output reg [size-1:0] dataout,
	output reg empty_n
);
	reg [size-1:0] datain_reg;
	
	reg case1reg, case2reg, case3reg, case1, case2, case3, basecase;
		
	always@(posedge clock)
		if (valid && ready)
			datain_reg <= datain;
	
	always@(posedge clock) begin
		if (reset) begin
			empty_n <= 0;
			dataout <= 0;
		end
		else begin
			if (case1reg) begin
				empty_n <= 1;
				dataout <= datain_reg;
			end
			else if (case2reg) begin
				empty_n <= 1;
				dataout <= prevdata;
			end
			else if (case3reg) begin
				empty_n <= 1;
				dataout <= datain_reg;
			end
				

		end
	end
	
	always@* begin
		basecase = !reset & valid & ready & prevempty_n;
		case1 =  basecase & !empty_n && datain >= prevdata;
		case2 = basecase & datain < prevdata;
		case3 = datain >= prevdata && datain < dataout;
	end
	
	always@(posedge clock) begin
		case1reg <= case1;
		case2reg <= case2;
		case3reg <= case3;
	end
	
endmodule
	
	