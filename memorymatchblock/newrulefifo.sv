module newrulefifo #(parameter CONCAT_WIDTH=64) (
	input clock,
	input reset,
	input [31:0] data,
	output [CONCAT_WIDTH-1:0] q,
	input wrreq,
	input rdack,
	output empty
);
	
	parameter cyclecount = (CONCAT_WIDTH/32 - (CONCAT_WIDTH%32==0));
	
	reg [CONCAT_WIDTH-1:0] entries [15:0];
	reg [$clog2(cyclecount+1)-1:0] writecount;
	reg [3:0] head;
	reg [3:0] tail;
	wire writeready;
	
	integer i;
	
	assign empty = head==tail;
	assign q = entries[tail];
	
	always@(posedge clock)
		if (reset) tail <= 0;
		else if (rdack && !empty) tail <= tail+1;
	
	always@(posedge clock)
		if (reset) head <= 0;
		else if (writeready) head <= head + 1;
		
	always@(posedge clock)
		if (reset) writecount <= 0;
		else if (writeready) writecount <= 0;
		else if (wrreq) writecount <= writecount + 1;
	
	always@(posedge clock)
		if (wrreq) entries[head] <= {entries[head],data};
	
	assign writeready = wrreq && (writecount == cyclecount);
	
	//!!!! Add writecount width - need log function!!!
	
endmodule 