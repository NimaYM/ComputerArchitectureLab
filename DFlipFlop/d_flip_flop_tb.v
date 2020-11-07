`timescale 1ns / 1ns
`include "d_flip_flop.v"
`include "../ClockGenerator/clock_generator.v"

module d_flip_flop_tb;
    parameter n = 10;
    reg D;
    wire clk, Q;
    integer i;

    clock_generator #(n) clock (clk);
    d_flip_flop dff(D, clk, Q);

    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);

        D <= 0;

        for(i = 0; i < n; i=i+1) begin
            #10 D = i[1];
        end

        $display("Test Completed!");
    end
endmodule 