module carry_lookahead_adder(X, Y, cin, result);
	parameter n = 64;
	
	input [n-1:0] X, Y;
	input cin;
	output [n:0] result;
	
	wire [n-1:0] P, G;
	wire [n:0] C;

	assign C[0] = cin;
	assign result[n] = C[n];

	genvar i;
	generate
		for(i = 0; i < n; i=i+1)
		begin
			assign P[i] = X[i]|Y[i];
			assign G[i] = X[i]&Y[i];
			assign C[i+1] = G[i] | (P[i]&C[i]);
		end
	endgenerate

	genvar j;
	generate
		for(j = 0; j < n; j=j+1)
		begin
			//FullAdder fa ( X[i], Y[i], cin, result[i], );
			assign result[j] = X[j] ^ Y[j] ^ C[j];
		end
	endgenerate
endmodule