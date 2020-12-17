module clock_generator #(parameter n = 10) (output reg clk);
    initial clk <= 0;
    always #10 clk <= (!clk);
endmodule    
