`timescale 1ns / 1ns
`include "../Adder/carry_lookahead_adder.v"
`include "../ShiftRegister/shift_register_2.v"

module PC;
    parameter n = 64;

    reg I, clk, direction, reset;
    reg [n-1:0] in;
    wire [n-1:0] out, sum;

    carry_lookahead_adder #(n) cla (out, 'd4, sum);
    shift_register_2 #(n) sr (I, clk, direction, reset, in, out, 1'b0);

    initial begin
        I <= 0;
        clk <= 0;
        direction <= 0;
        reset <= 1;
        #5 in <= 0;
    end

    always #10 clk = ~clk;

    initial begin
        $dumpfile("PC.vcd");
        $dumpvars(0, PC);

        #20 assign in = sum;
    end

    always @(negedge clk) begin
		$display ( sum );
	end
endmodule