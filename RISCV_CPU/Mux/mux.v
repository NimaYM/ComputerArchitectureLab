module mux (A, B, selection, out);
    parameter n = 32;
    input [n-1:0] A, B;
    input selection;
    output [n-1:0] out;

    assign out = (selection == 1) ? B : A;
endmodule