`timescale 1ns/1ns
module packetstorage_tb();

	parameter PIPELN=10'd7;
	reg clock;
	reg reset;
	
	reg [63:0] instream_data;
	wire instream_valid;
	wire instream_sop;
	wire instream_eop;
	wire instream_ready; //y
	wire [63:0] outstream_data; //y
	wire outstream_valid; //y
	wire outstream_sop; //y
	wire outstream_eop; //y
	wire [5:0] outstream_channel;
	reg outstream_ready;
	
	wire [7:0] tagstream_data;
	wire tagstream_valid;
	wire tagstream_ready;
	
	wire [63:0] sendstream_data;
	wire sendstream_valid;
	wire sendstream_sop;
	wire sendstream_eop;
	wire [1:0] sendstream_channel;

	wire sendstream_ready;
	assign sendstream_ready = 1;
	
	reg [1:0] count;
	reg [7:0] result_pipe[PIPELN-1:0];
	reg valid_pipe [PIPELN-1:0];
	reg doShift;
	integer i;
	
	packetstorage DUT (.*);

	initial begin 
		clock = 0;
		forever #5 clock = ~clock;
	end
	
	initial begin
		reset = 1;
		count = 0;
		#10 reset = 0;
	end
	
	initial begin
		instream_data = 0;
		forever #10 instream_data = instream_data +1;
	end
	
	always@(posedge clock)
		if (reset) count <=0;
		else count <=count+1;
	
	assign instream_valid = ~reset;
	assign outstream_ready = outstream_valid;
	assign instream_sop = count[1:0]==0 && instream_valid;
	assign instream_eop = count[1:0]==3 && instream_valid;
	
/*	always@(posedge clock) 
		if (reset) for (i=0; i<PIPELN; i=i+1) result_pipe[i]<=0;
		else if (outstream_valid && outstream_ready && outstream_eop) begin
			result_pipe[0] <= {outstream_valid, count,outstream_channel};
			for (i=1; i<PIPELN; i=i+1) result_pipe[i] <= result_pipe[i-1];
		end
		else if (result_pipe[PIPELN-1][8]) result_pipe[PIPELN-1][8] <= 0;
*/	
	always@(posedge clock) 
		if (reset) for (i=0; i<PIPELN; i=i+1) result_pipe[i]<=0;
		else begin
			if (tagstream_ready) begin
				for (i=PIPELN-1; i>=1; i=i-1) begin
					valid_pipe[i] <= valid_pipe[i-1];
					result_pipe[i] <= result_pipe[i-1];
				end
				valid_pipe[0] <= outstream_valid && outstream_ready && outstream_eop;
				result_pipe[0] <= {count,outstream_channel};
			end
			else begin
				doShift = 0;
				for (i=PIPELN-1; i>=1; i=i-1) 
					if (!valid_pipe[i] || doShift) begin
						valid_pipe[i] <= valid_pipe[i-1];
						result_pipe[i] <= result_pipe[i-1];
						doShift = 1;
					end
				if (!valid_pipe[0] || doShift) begin
					valid_pipe[0] <= outstream_valid && outstream_ready && outstream_eop;
					result_pipe[0] <= {count,outstream_channel};
				end
			end
		end
	assign tagstream_valid = valid_pipe[PIPELN-1];
	assign tagstream_data = result_pipe[PIPELN-1];
	
endmodule
