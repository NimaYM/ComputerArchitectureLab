module imm_gen(instruction, out);
    input [31:0] instruction;
    output [63:0] out;
    reg [63:0] immOut;
    wire [6:0] opcode;

    assign out = immOut;
    assign opcode = instruction[6:0];

    always @(instruction)
        casex(opcode)
            7'b0000011: immOut <= { {53{instruction[31]}}, instruction[30:20]}; //I-type(for ld)
            7'b0100011: immOut <= { {53{instruction[31]}}, instruction[30:25], instruction[11:7]}; //S-type(for sd)
            7'b1100011: immOut <= { {52{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; //SB-type(for beq)
            default: immOut <= 64'bx;
        endcase
endmodule