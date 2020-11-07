`timescale 1ns / 1ns
`include "carry_lookahead_adder.v"

module carry_lookahead_adder_tb;
  parameter n = 64;
  reg [n-1:0] A = 0;
  reg [n-1:0] B = 0;
  wire [n:0]  result; 
  carry_lookahead_adder carry_lookahead_inst (A, B, 1'b0, result);
  initial begin

    $dumpfile("carry_lookahead_adder_tb.vcd");
    $dumpvars(0, carry_lookahead_adder_tb);

      #10;
      A = 'd64;
      B = 'd64;
      #10;
      A = 'd1000000000;
      B = 'd1000000000;
      #10;
      A = 'd123;
      B = 'd73;
      #10;
      A = 'd246;
      B = 'd562;
      #10;
      A = 'd112233;
      B = 'd332211;
      #10;
      A = 'd123456;
      B = 'd654321;
      #10;

      $display("Test Completed!");
    end
endmodule 
