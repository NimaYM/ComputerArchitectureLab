`timescale 1ns / 1ns
`include "multiplexer_4to1.v"

module multiplexer_4to1_tb;
    reg [3:0] W;
    reg [1:0] S;
    wire f;
    integer i;

    multiplexer_4to1 mux (W, S, f);

    initial begin
        $dumpfile("multiplexer_4to1_tb.vcd");
        $dumpvars(0, multiplexer_4to1_tb);

        for(i = 0; i < 16; i=i+1) begin
            S = i[1:0];
            W = i;
            display;
        end
    end
    
    task display;
      #10 $display("W = %4b", W, " S = %0d", S, " f = ", f);
    endtask
endmodule 