`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "control.v"

module control_tb;
   wire clk;
   reg[ 31:0] instruction;
   wire [6:0] opcode;
   wire branch, memRead, memToReg, memWrite, aluSrc , regWrite;
   wire [1:0] aluOp;

   wire [7:0] controls;
   assign controls = {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp};

   assign opcode = instruction[6:0];

   clock_generator clock (clk);
   control ctrl(opcode, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);

   initial begin
      $dumpfile("control_tb.vcd");
      $dumpvars(0, control_tb);

      @(posedge clk); instruction <= 32'h12345633; $strobe("add \t\t %b", controls);

      @(posedge clk); instruction <= 32'h12345603; $strobe("ld \t\t %b", controls);

      @(posedge clk); instruction <= 32'h123456A3; $strobe("sd \t\t %b", controls);

      @(posedge clk); instruction <= 32'h12345663; $strobe("beq \t\t %b", controls);

      @(posedge clk); instruction <= 32'h123456FF; $strobe("ILLEGAL OP\t %b\n", controls);

      #15 $finish;
   end
endmodule