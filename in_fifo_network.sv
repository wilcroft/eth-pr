module in_fifo_network #(parameter ncount = 8) (
input clock,
input sclr,
input [127:0] st_data,
input st_sop, st_eop,
input st_valid,
input [11:0] st_channel,
output reg st_ready,

input pnode_ready [ncount-1:0],
output reg [141:0]pnode_data [ncount-1:0],
output pnode_valid [ncount-1:0],
output xoff
);

reg rdtowrbuf [ncount-1:0];
//reg [73:0] data [ncount-1:0];
reg [143:0] data [ncount-1:0];
reg wrreq[ncount-1:0], rdreq[ncount-1:0];

wire full [ncount-1:0], empty[ncount-1:0];
wire almost_full [ncount-1:0];
//wire [73:0]q [ncount-1:0];
wire [143:0]q [ncount-1:0];

genvar i;
integer x;

assign xoff = almost_full[0];

always@* for (x=0; x<ncount; x=x+1)
	pnode_data[x] = q[x][141:0];

//assign pnode_data = q[137:0][ncount-1:0];
assign pnode_valid = rdtowrbuf;//rdreq; //

generate 
	for (i=0; i<ncount; i=i+1) begin : genloop
		in_node_fifo innode (.data(data[i]),
				.rdreq(rdreq[i]),
				.wrreq(wrreq[i]),
				.empty(empty[i]),
				.full(full[i]),
				.q(q[i]),
				.almost_full(almost_full[i]),
				.*);
	end
endgenerate

always@* begin
	wrreq[0] = st_valid && !full[0];
	st_ready = !full[0];
	data[0] = {st_channel, st_sop, st_eop, st_data};
	for (x = 1; x < ncount; x = x + 1) begin
		wrreq[x] = rdtowrbuf[x-1];// rdreq[x-1]; //
		data[x] = q[x-1];
	end
end	

always@* begin
	for (x=0; x<ncount-1; x=x+1)
		rdreq[x] = !empty[x] & !full[x+1] & pnode_ready[x];
	rdreq[ncount-1] = !empty[ncount-1] & pnode_ready[ncount-1];
end

initial 
	for (x = 0; x < ncount; x = x + 1)
		rdtowrbuf[x] <= 0;

always@(posedge clock)
	for (x = 0; x < ncount; x = x + 1)
		rdtowrbuf[x] <= rdreq[x];

//assign data = {6'b0, st_sop, st_eop, st_data};

//in_node_fifo dut (.*);
/*
initial begin
	clock = 0;
	forever #5 clock = ~clock;
end

initial sclr = 0;

initial begin
	st_sop = 1;
	st_eop = 0;
	st_valid = 1;
	st_data = 'h1234567890ABCDEF;
end
*/
endmodule
