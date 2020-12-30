module alu_control(aluOp, funct7, funct3, aluControl);
    input [1:0] aluOp;
    input [6:0] funct7;
    input [2:0] funct3;
    output reg [3:0] aluControl;

    always @(aluOp | funct7 | funct3)
        case(aluOp)
            2'b00: aluControl <= 4'b0010; //add (for ld & sd instruction)
            2'b01: aluControl <= 4'b0110; //sub (for beq instruction)

            // R-type instructions
            2'b10: casex({funct7, funct3})
                    10'b0000000000: aluControl <= 4'b0010; //add
                    10'b0000000111: aluControl <= 4'b0000; //and
                    10'b0000000110: aluControl <= 4'b0001; //or
                    10'b0100000000: aluControl <= 4'b0110; //sub
                    default: aluControl <= 4'bxxxx;
                endcase

            default: aluControl <= 4'bxxxx;
        endcase
endmodule