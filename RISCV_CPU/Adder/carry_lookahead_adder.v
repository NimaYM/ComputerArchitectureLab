module carry_lookahead_adder(X, Y, result);
	parameter n = 64;
	
	input [n-1:0] X, Y;
	output [n:0] result;
	
	wire [n-1:0] P, G;
	wire [n:0] C;

	assign C[0] = 1'b0;
	assign result[n] = C[n];

	genvar i;
	generate
		for(i = 0; i < n; i=i+1)
		begin
			assign P[i] = X[i]|Y[i];
			assign G[i] = X[i]&Y[i];
			assign C[i+1] = G[i] | (P[i]&C[i]);

			assign result[i] = X[i] ^ Y[i] ^ C[i];
		end
	endgenerate
endmodule