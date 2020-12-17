`timescale 1ns / 1ns
`include "d_flip_flop.v"
`include "../ClockGenerator/clock_generator.v"

module d_flip_flop_tb;
    parameter n = 20;
    reg D;
    wire clk, Q;
    integer i;

    clock_generator clock (clk);
    d_flip_flop dff(D, clk, Q);

    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);

        D <= 0;

        for(i = 0; i < n; i=i+1) begin
            D = i[1];
            display;
        end
    end

    task display;
      #10 $display("Clock = ", clk, " D = ", D, " Q = ", Q);
    endtask
endmodule 