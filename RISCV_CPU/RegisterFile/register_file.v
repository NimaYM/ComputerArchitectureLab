module register_file(regWrite, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2, clk);  
    input[4:0] readRegister1, readRegister2, writeRegister;
    input[31:0] writeData;
    output reg[31:0] readData1, readData2;
    reg[31:0] registerFile[0:31];
    input clk, regWrite;

    always @(readRegister1) 
        readData1 <= (readRegister1 != 0) ? registerFile[readRegister1] : 0;

    always @(readRegister2)
        readData2 <= (readRegister2 != 0) ? registerFile[readRegister2] : 0;
    
    always @(negedge clk) 
        if (regWrite == 1) registerFile[writeRegister] <= writeData;
endmodule