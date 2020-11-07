`timescale 1ns / 1ns
`include "shift_register_2.v"

module shift_register_tb;
    parameter n = 8;

    reg I;
    reg clk;
    reg direction;
    reg reset;
    wire [n-1:0] D;

    shift_register_2 #(n) sr (I, clk, direction, reset, D);

    initial
        $monitor ("I = %b, direction = %0b, D = %b", I, direction, D);

    initial begin       
        I <= 0;
        clk <= 0;
        direction <= 0;
        reset <= 0;
    end

    always #10 clk = ~clk;

    initial begin
        $dumpfile("shift_register_tb.vcd");
        $dumpvars(0, shift_register_tb);

        reset <= 0;
        #20 reset <= 1;

        repeat (4) @ (posedge clk)
            I = ~I;
        #10 direction <= 1;
        repeat (4) @ (posedge clk)
            I = ~I;

        repeat (4) @ (posedge clk)

        $finish;
    end
endmodule 