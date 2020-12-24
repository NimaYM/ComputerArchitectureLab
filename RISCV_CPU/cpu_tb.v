`timescale 1ns / 1ns
`include "ClockGenerator/clock_generator.v"
`include "cpu.v"

module cpu_tb;
    wire clk;
    wire [5:0] address;
    reg [5:0] testData;
    integer i;

    assign address = testData;

    clock_generator clock (clk);
    cpu cpu_instance (clk, address);

    initial begin
        $dumpfile("cpu_tb.vcd");
        $dumpvars(0, cpu_tb);

        i = 0;
        while(i <= 6) begin
            @(posedge clk); testData <= i;
            i = i+1;
        end

        $finish;
    end
endmodule