module RippleCarryAdder(X, Y, cin, result);
	parameter n = 64;
	input [n-1:0] X, Y;
	input cin;
	output reg [n:0] result;
	reg [n:0] C;
	integer k;
	always@(X, Y, cin)
	begin
		C[0] = cin;
		for(k = 0; k < n; k=k+1)
		begin
		  result[k] = X[k] ^ Y[k] ^ C[k];
			C[k+1] = (X[k]&Y[k]) | (X[k]&C[k]) | (Y[k]&C[k]);
		end
		result[n] = C[n];
	end
endmodule
	
