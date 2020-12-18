module control(opcode, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
    input[6:0] opcode;
    output branch, memRead, memToReg, memWrite, aluSrc ,regWrite;
    output [1:0] aluOp;

    reg [7:0] controls;
    assign {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp} = controls;

    always @(opcode)
        casex(opcode)
            7'b0110011: controls <= 8'b00100010;  // R-Type
            7'b0000011: controls <= 8'b11110000;  // ld
            7'b0100011: controls <= 8'b1x001000;  // sd
            7'b1100011: controls <= 8'b0x000101;  // beq
            default:    controls <= 8'bxxxxxxxx;  // illegal operation
        endcase
endmodule
