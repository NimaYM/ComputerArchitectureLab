module multiplexer_4to1(input[3:0] W, input[1:0] S, output reg f);
    always @(W, S) begin
        case (S)
            0: f = W[0];
            1: f = W[1];
            2: f = W[2];
            3: f = W[3];
        endcase
    end
endmodule