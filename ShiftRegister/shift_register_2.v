module shift_register_2 (I, clk, direction, reset, D);
    parameter n = 16;

    input I, clk, direction, reset;
    output reg [n-1:0] D;

    always @(posedge clk) begin
        if (!reset) D <= 0;
        else begin
            D <= (direction) ? ({D[n-2:0], I}) : ({I, D[n-1:1]});
        end 
    end 
endmodule