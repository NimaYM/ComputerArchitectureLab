module alu(X, Y, aluControl,  aluResult, zero);
    input  [63:0] X, Y;
    input  [3:0] aluControl;
    output reg [63:0] aluResult;
    output zero;

    assign zero = (aluResult==0) ? 1 : 0;

    always @(aluControl | X | Y)
    casex (aluControl)
        0: aluResult <= (X & Y);
        1: aluResult <= (X | Y);
        2: aluResult <= (X + Y);
        6: aluResult <= (X - Y);
        default: aluResult <= 0;
    endcase
endmodule