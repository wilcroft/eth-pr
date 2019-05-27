module sorterblock #(parameter blockcount = 16, size = 16) (
	input clock,
	input reset,
	input [size-1:0] datain,
	input datain_valid,
	output datain_ready,
	output [size-1:0] dataout [blockcount-1:0],
	output dataout_valid [blockcount-1:0]
);

	genvar i;
	//wire data_empty [blockcount-1:0];
	
	always@(posedge clock)
		if (reset) datain_ready <= 1;
		else if (datain_valid && datain_ready) datain_ready <= 0;
		else if (~datain_ready) datain_ready <= 1;
	
	generate
		for (i=0; i<blockcount; i=i+1) begin : sortergen
			if (i==0) begin
				sorterunit #(.size(size)) s0 (
					.clock,
					.reset,
					.datain,
					.valid(datain_valid),
					.ready(datain_ready),
					.prevdata({size{1'd0}}),
					.prevempty_n(1'b1),
					.dataout(dataout[i]),
					.empty_n(dataout_valid[i])
				);
			end
			else begin
				sorterunit #(.size(size)) si (
					.clock,
					.reset,
					.datain,
					.valid(datain_valid),
					.ready(datain_ready),
					.prevdata(dataout[i-1]),
					.prevempty_n(dataout_valid[i-1]),
					.dataout(dataout[i]),
					.empty_n(dataout_valid[i])
				);
			end
		end
	endgenerate

endmodule 