`include "InstructionMemory/instruction_memory.v"
`include "DataMemory/data_memory.v"
`include "Control/control.v"
`include "ALU_Control/alu_control.v"
`include "RegisterFile/register_file.v"
`include "ImmGen/imm_gen.v"
`include "ALU/alu.v"
`include "Mux/mux.v"

module cpu(clk, address);
    input clk;
    input [5:0] address;
    wire memWrite, memRead, branch, memToReg, aluSrc , regWrite, zero;
    wire [1:0] aluOp;
    wire [3:0] aluControl;
    wire [31:0] instruction;
    wire [63:0] writeData, readData, readData1, readData2, immOut, secondInputAlu, aluResult;

    mux #(64) mux_instance1 (readData2, immOut, aluSrc, secondInputAlu);
    mux #(64) mux_instance2 (readData, aluResult, memToReg, writeData);

    instruction_memory instruction_memory_instance (address, instruction);
    data_memory data_memory_instance (clk, memWrite, memRead, aluResult[5:0], readData2,  readData);

    control control_instance (instruction[6:0], branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
    alu_control alu_control_instance (aluOp, instruction[31:25], instruction[14:12], aluControl);

    register_file register_file_instance (regWrite, instruction[19:15], instruction[24:20], instruction[11:7], writeData, readData1, readData2, clk);

    imm_gen imm_gen_instance (instruction, immOut);

    alu alu_instance (readData1, secondInputAlu, aluControl, aluResult, zero);
endmodule