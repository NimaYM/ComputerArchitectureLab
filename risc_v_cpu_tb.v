`timescale 1ns / 1ns
`include "./64BitAdder/carry_lookahead_adder.v"
`include "./ShiftRegister/shift_register_2.v"

module risc_v_cpu_tb;
    parameter n = 64;

    reg I, clk, direction, reset;
    reg [n-1:0] in;
    wire [n-1:0] out, sum;

    carry_lookahead_adder #(n) cla (out, 'd10, 1'b0, sum);
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
        $dumpfile("risc_v_cpu_tb.vcd");
        $dumpvars(0, risc_v_cpu_tb);

        #20 assign in = sum;
    end

    always @(negedge clk) begin
		$display ( sum );
	end
endmodule