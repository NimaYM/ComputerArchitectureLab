`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "register_file.v"

module register_file_tb;  
    reg [4:0] readRegister1, readRegister2, writeRegister;
    reg [31:0] writeData;
    wire [31:0] readData1, readData2;
    wire clk;
    reg regWrite;
    integer i;

    clock_generator clock (clk);
    register_file rf(regWrite, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2, clk);

    initial begin
        $dumpfile("register_file_tb.vcd");
        $dumpvars(0, register_file_tb);

        i = 0;
        while(i <= 15) begin
            @(posedge clk); readRegister1 <= i;  readRegister2 <= i+1;
            i = i+1;
        end

        #15 regWrite <= 1; writeData = 32'h12345678;
        i = 0;
        while(i <= 15) begin
            @(posedge clk); writeRegister <= i;  writeData <= i+1;
            i = i+1;
        end
        #15 readRegister1<=32'hXXXXXXXX; readRegister2<=32'hXXXXXXXX; regWrite<=0;

        i = 0;
        while(i <= 15) begin
            @(posedge clk); readRegister1 <= i;  readRegister2 <= i+1;
            i = i+1;
        end
        #15 $finish;
    end
endmodule