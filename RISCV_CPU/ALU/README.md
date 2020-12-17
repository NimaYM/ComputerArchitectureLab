# Arithmetic Logic Unit

In computing, an arithmetic logic unit (ALU) is a combinational digital circuit that performs arithmetic and bitwise operations on integer binary numbers.
For more information, see [this link](https://en.wikipedia.org/wiki/Arithmetic_logic_unit).

## Testbench Result

```text
AND unit testing
000000000000aaaa & 0000000000000110 = 0000000000000000
00000000ffffffff & 0000000001010101 = 0000000001010101

OR unit testing
000000000000aaaa | 00000000aaaa0000 = 00000000aaaaaaaa
0000000011001100 | 0000000001010101 = 0000000011011101

Addition unit testing
123   +  321 =  444
750   +  250 = 1000

Subtraction unit testing
128   -   64 =   64
12345 - 2345 = 10000
```
