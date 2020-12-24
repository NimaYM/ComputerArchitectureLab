module data_memory(clk, memWrite, memRead, address, writeData, readData);
    input clk, memWrite, memRead;
    input [5:0] address;
    input [63:0] writeData;
    output [63:0] readData;
    reg [63:0] RAM[0:63];

    reg [63:0] readDataReg;
    assign readData = readDataReg;

    always @(posedge clk) begin
        if(memWrite) RAM[address] <= writeData;
        else if(memRead) readDataReg = RAM[address];
    end
        
endmodule