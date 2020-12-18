`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "../Control/control.v"
`include "alu_control.v"

module alu_control_tb;
   wire clk;
   reg [31:0] instruction;
   wire [6:0] opcode;
   wire branch, memRead, memToReg, memWrite, aluSrc , regWrite;
   wire [1:0] aluOp;
   wire [6:0] funct7;
   wire [2:0] funct3;
   wire [3:0] aluControl;

   wire [7:0] controls;  
   assign controls = {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp};

   assign opcode = instruction[6:0];
   assign funct3 = instruction[14:12];
   assign funct7 = instruction[31:25];  

   clock_generator clock (clk);
   control ctrl(opcode, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
   alu_control alu_ctrl(aluOp, funct7, funct3, , aluControl);

   initial begin
      $dumpfile("alu_control_tb.vcd");
      $dumpvars(0, alu_control_tb);

      @(posedge clk); instruction <= 32'h00512003; $strobe("add (ld):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h000122A3; $strobe("add (sd):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h00104263; $strobe("subtract (beq):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h00208033; $strobe("add (R-type):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h41FF8FB3; $strobe("subtract (R-type):\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h0056F033; $strobe("AND (R-type):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'h0178E1B3; $strobe("OR (R-type):\t\tALUOp = %b\t\t aluControl = %b", aluOp, aluControl);

      @(posedge clk); instruction <= 32'hFFFFFFFF; $strobe("ILLEGAL OP:\t\tALUOp = %b\t\t aluControl = %b\n", aluOp, aluControl);

      #15 $finish;
   end
endmodule