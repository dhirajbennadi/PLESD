module fourBitCounter_verilog (P, CP, SR, PE, CEP, CET, Q, TC);

// Define input and output
input [3:0] P;			// Parallel Input
input CP;				// Clock
input SR;				// Active Low Synchronous Reset
input PE;				// Count Enable Parallel Input
input CEP;				// Count Enable Parallel
input CET;				// Count Enable Trickle
output reg [3:0] Q;	// Parallel Output
output reg TC; 		// Terminal Count

reg [3:0] count;

always @ (posedge CP) begin

	if (SR == 1'b0) begin
		count <= 4'b0000; 
	end else if (PE == 1'b0) begin
		count <= P;
	end else if ((PE == 1'b1) && (CET == 1'b1) && (CEP == 1'b1)) begin
		case (count)
			4'b0000 : count <= 4'b0001;
			4'b0001 : count <= 4'b0010;
			4'b0010 : count <= 4'b0011;
			4'b0011 : count <= 4'b0100;
			4'b0100 : count <= 4'b0101;
			4'b0101 : count <= 4'b0110;
			4'b0110 : count <= 4'b0111;
			4'b0111 : count <= 4'b1000;
			4'b1000 : count <= 4'b1001;
			4'b1001 : count <= 4'b1010;
			4'b1010 : count <= 4'b1011;
			4'b1011 : count <= 4'b1100;
			4'b1100 : count <= 4'b1101;
			4'b1101 : count <= 4'b1110;
			4'b1110 : count <= 4'b1111;
			4'b1111 : count <= 4'b0000;
			default : count <= 4'b0000;
		endcase

	end else begin
		//CET CEP 0
	end
	
	if (count == 4'b1111) begin
		TC <= 1'b1; 
	end else begin
		TC <= 1'b0;
	end
	Q <= count; 
	
end

endmodule 