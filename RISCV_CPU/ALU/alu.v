module alu(X, Y, aluControl,  aluOut, zero, aluResult);
    input  [63:0] X, Y;
    input  [3:0] aluControl;
    output reg [63:0] aluOut;
    output zero, aluResult;

    assign zero = (aluOut==0) ? 1 : 0;
    assign aluResult = aluOut[0];

    always @(aluControl | X | Y)
    casex (aluControl)
        0: aluOut <= (X & Y);
        1: aluOut <= (X | Y);
        2: aluOut <= (X + Y);
        6: aluOut <= (X - Y);
        default: aluOut <= 0;
    endcase
endmodule