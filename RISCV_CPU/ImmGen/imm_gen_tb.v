`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "imm_gen.v"

module imm_gen_tb;
    wire clk;
    reg [31:0] instruction;
    wire [63:0] immOut;

    clock_generator clock (clk);
    imm_gen imm_gen_instance (instruction, immOut);

    initial begin
        $dumpfile("imm_gen_tb.vcd");
        $dumpvars(0, imm_gen_tb);

        @(posedge clk); instruction = 32'h0F053483; display;  // ld x9, 240(x10)

        @(posedge clk); instruction = 32'h0E953823; display;  // sd x9, 240(x10)

        @(posedge clk); instruction = 32'h7CB50863; display;  // beq x10, x11, 2000

        #20 $finish;
    end

    task display;
      #1 $display("immOut = %00b", immOut);
    endtask

endmodule