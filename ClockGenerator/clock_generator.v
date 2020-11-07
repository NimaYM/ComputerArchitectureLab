module clock_generator #(parameter n = 10) (output reg clk);
    integer i;
    initial begin
        clk = 0; 
        for(i = 0; i < n; i=i+1) begin
            #10 clk = ~clk;
        end
    end
endmodule