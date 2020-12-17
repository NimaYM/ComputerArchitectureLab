module shift_register_2 (I, clk, direction, reset, in, out, enable);
    parameter n = 16;

    input I, clk, direction, reset, enable;
    input [n-1:0] in;
    output reg [n-1:0] out;

    always @(posedge clk) begin
        if (!reset) out <= 0;
        else begin
            if(enable)
                out <= (direction) ? ({in[n-2:0], I}) : ({I, in[n-1:1]});
            else
                out <= in;
        end 
    end 
endmodule