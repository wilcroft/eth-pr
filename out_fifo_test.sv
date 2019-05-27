`timescale 1ns/1ns
module out_fifo_test ();

localparam ncount = 8, rwcount = 6;

reg clock;
reg sclr;
reg [7:0] fin [ncount-1:0];
reg fin_rdreq [ncount-1:0];
reg fin_wrreq [ncount-1:0];
wire fin_empty [ncount-1:0];
wire fin_full [ncount-1:0];
wire [7:0] fin_q [ncount-1:0];

reg [7:0] dataout [ncount-1:0];
reg data_valid [ncount-1:0];
reg data_ack [ncount-1:0];

genvar i;
integer x;
integer wrcount [ncount-1:0], rdcount [ncount-1:0];

generate 
	for (i=0; i<ncount; i=i+1) begin : genloop
		out_node_fifo fi (.data(fin[i]),
							.rdreq(fin_rdreq[i]),
							.wrreq(fin_wrreq[i]),
							.empty(fin_empty[i]),
							.full(fin_full[i]),
							.q(fin_q[i]),
							.*);
	end
endgenerate

initial begin
	clock = 0;
	for (x=0; x<ncount; x=x+1) begin
		data_valid[x] = 1;
		wrcount[x] = rwcount;
		rdcount[x] = 0;
	end
	forever #10 clock = ~clock;
end

always @* begin
	sclr = 0;
	data_ack[0] = data_valid[0]&&!fin_full[0];
	fin_wrreq[0] = data_valid[0]&& !fin_full[0];
	fin[0] = data_valid[0]? dataout [0]: 8'bzzzzzzzz;
	for (x=1; x<ncount; x=x+1) begin
		fin [x] = fin_empty[x-1]? (data_valid[x]? dataout[x]:8'bzzzzzzzz): fin_q[x-1];
		data_ack[x] = fin_empty[x-1]? data_valid[x]&&!fin_full[x]: 0;
		fin_rdreq[x-1] = fin_empty[x-1]? 0: !fin_full[x] ;
		fin_wrreq[x] = fin_full[x]? 0 : (fin_empty[x-1] ?data_valid[x]: 1);
	end
	fin_rdreq[ncount-1] = !fin_empty[ncount-1];
end	


initial begin
	for (x=0; x<ncount; x=x+1) begin
		dataout[x] = x;
	end
end

reg done;
always@* begin
	done = 1;
	for (x=0; x<ncount; x=x+1) begin
		data_valid[x] = (wrcount[x] != 0);
		if (data_valid[x]) done = 0;
		if (!fin_empty[x]) done = 0;
		if (rdcount[x] !=rwcount) done = 0;
	end
	if (done) $stop;

end

always@(posedge clock) begin
	for (x=0; x<ncount; x=x+1)
		if (data_ack[x]) begin
			wrcount[x] <= wrcount[x] -1;
		end
	if (fin_rdreq[ncount-1]) rdcount[fin_q[ncount-1]] +=1;
end

endmodule
