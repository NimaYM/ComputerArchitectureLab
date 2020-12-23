`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "mux.v"

module mux_tb;
    wire clk;
    reg[ 31:0] A, B;
    wire [31:0] out;
    reg selection;

    clock_generator clock (clk);
    mux mux_instance (A, B, selection , out);

    initial begin
      $dumpfile("mux_tb.vcd");
      $dumpvars(0, mux_tb);

      @(posedge clk); A = 0; B = 32'h12345678; selection <= 0; display; @(posedge clk); selection <= 1; display;

      @(posedge clk); A = 0; B = 32'h87654321; selection <= 0; display; @(posedge clk); selection <= 1; display;

      @(posedge clk);  A = 32'h11112222; B=0; selection <= 0; display; @(posedge clk); selection <= 1; display;

      #20 $finish;
    end

    task display;
      #1 $display("A = %0h B = %0h selection = %0b out = %0h", A, B, selection, out);
    endtask
endmodule 