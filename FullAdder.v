module FullAdder(x, y, cin, s, cout);
	input x, y, cin;
	output s, cout;
	assign s = x ^ y ^ cin;
	assign cout = (x&y) | (cin&(x^y));
endmodule
