`timescale 1ns / 1ns
`include "shift_register.v"
`include "../ClockGenerator/clock_generator.v"

module test_tb;
    parameter n = 8;

    reg I;
    reg clk;
    reg bit;
    reg reset;
    reg enable;
    wire [n-1:0] D;

    shift_register #(n) sr (I, bit, S, clk, Q);

    initial
        $monitor ("I = %b, direction = %0b, D = %b, enable = %b", I, direction, D, enable);

    initial begin       
        I <= 0;
        clk <= 0;
        direction <= 0;
        reset <= 0;
        enable <= 1;
    end

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

    task display;
      #10 $display("Clock = ", clk, " D = ", D, " Q = ", Q);
    endtask
endmodule 