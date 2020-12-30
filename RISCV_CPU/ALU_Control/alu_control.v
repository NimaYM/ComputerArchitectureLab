module alu_control(aluOp, funct7, funct3, aluControl);
    input [1:0] aluOp;
    input [6:0] funct7;
    input [2:0] funct3;
    output reg [3:0] aluControl;

    always @(aluOp | funct7 | funct3)
        case(aluOp)
            2'b00: aluControl <= 4'b0010; //add (for ld, sd)
            2'b01: aluControl <= 4'b0110; //sub (for beq)

            // R-type instructions
            default: casex(funct7)
                7'b0000000: casex(funct3)
                    3'b000: aluControl <= 4'b0010; //add
                    3'b111: aluControl <= 4'b0000; //and
                    3'b110: aluControl <= 4'b0001; //or
                    default: aluControl <= 4'bxxxx;
                endcase

                7'b0100000: aluControl <= 4'b0110; //sub
                default: aluControl <= 4'bxxxx;
            endcase
        endcase
endmodule