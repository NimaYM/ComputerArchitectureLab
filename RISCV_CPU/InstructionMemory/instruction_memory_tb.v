`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "instruction_memory.v"

module instruction_memory_tb;
    wire clk;
    reg [47:0] address;
    wire [31:0] instruction;
    integer i;

    clock_generator clock (clk);
    instruction_memory instruction_memory_instance (address, instruction);

    initial begin
        $dumpfile("instruction_memory_tb.vcd");
        $dumpvars(0, instruction_memory_tb);

        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i;
            i = i+1;
        end

        #10 $finish;
    end

endmodule