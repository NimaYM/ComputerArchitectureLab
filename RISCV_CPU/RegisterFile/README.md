# Register File

A register file is an array of processor registers in a central processing unit (CPU).
For more information, see [this link](https://en.wikipedia.org/wiki/Program_counter).

## Testbench

To see the result of written testbench, use this commands:

```text
iverilog -o register_file_tb.vvp register_file_tb.v
vvp register_flie_tb.vvp
gtkwave
```
