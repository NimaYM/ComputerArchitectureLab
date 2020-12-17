`timescale 1ns / 1ns
`include "carry_lookahead_adder.v"

module carry_lookahead_adder_tb;
  parameter n = 64;
  reg [n-1:0] X;
  reg [n-1:0] Y;
  wire [n:0]  result;

  carry_lookahead_adder #(n) carry_lookahead_adder_instance (X, Y, result);

  initial begin
      $dumpfile("carry_lookahead_adder_tb.vcd");
      $dumpvars(0, carry_lookahead_adder_tb);

      X = 'd64;
      Y = 'd64;
      display;
      #10;

      X = 'd1000;
      Y = 'd1000;
      display;
      #10

      X = 'd123;
      Y = 'd73;
      display;
      #10;

      X = 'd246;
      Y = 'd562;
      display;
      #10;

      X = 'd112233;
      Y = 'd332211;
      display;
      #10;

      X = 'd123456;
      Y = 'd654321;
      display;
    end

    task display;
      #1 $display("%0d + %0d = %0d", X, Y, result);
    endtask
endmodule 
