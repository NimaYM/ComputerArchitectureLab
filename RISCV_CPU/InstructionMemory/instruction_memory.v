module instruction_memory(address, instruction);
    input [5:0] address;
    output [31:0] instruction;
    reg [31:0] RAM[0:63];

    // some random data for initialization of RAM
    initial $readmemh("instruction_memory_tb.dat", RAM);

    assign instruction = RAM[address];
endmodule