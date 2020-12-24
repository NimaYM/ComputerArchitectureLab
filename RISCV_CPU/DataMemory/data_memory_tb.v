`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "data_memory.v"

module data_memory_tb;
    wire clk;
    reg [5:0] address;
    reg memWrite, memRead;
    reg [63:0] writeData;
    wire [63:0] readData;
    integer i;

    clock_generator clock (clk);
    data_memory data_memory_instance (clk, memWrite, memRead, address , writeData , readData);

    initial begin
        $dumpfile("data_memory_tb.vcd");
        $dumpvars(0, data_memory_tb);

        memWrite <= 0;
        memRead <= 0;

        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5;
            i = i+1;
        end

        #10 memWrite <= 1; writeData = 32'h12345678;
        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5; writeData <= i+1;
            i = i+1;
        end

        #10 address <= 32'hXXXXXXXX; memWrite <= 0; memRead <= 1;
        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5;
            i = i+1;
        end
        
        #10 $finish;
    end
endmodule