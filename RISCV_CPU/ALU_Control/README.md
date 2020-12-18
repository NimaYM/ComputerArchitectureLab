# ALU Control

How the ALU control bits are set depends on the ALUOp control bits and the different opcodes for the R-type instruction.

![alu_control](./alu_control.png)

The instruction, listed in the first column, determines the setting of the ALUOp bits. All the encodings are shown in binary.
Notice that when the ALUOp code is 00 or 01, the desired ALU action does not depend on the funct7 or funct3 fields; in this case, we say that we “don’t care” about the value of the opcode, and the bits are shown as Xs.
When the ALUOp value is 10, then the funct7 and funct3 fields are used to set the ALU control input.

## Testbench Result

```text
add (ld):               ALUOp = 00               aluControl = 0010
add (sd):               ALUOp = 00               aluControl = 0010
subtract (beq):         ALUOp = 01               aluControl = 0110
add (R-type):           ALUOp = 10               aluControl = 0010
subtract (R-type):      ALUOp = 10               aluControl = 0110
AND (R-type):           ALUOp = 10               aluControl = 0000
OR (R-type):            ALUOp = 10               aluControl = 0001
ILLEGAL OP:             ALUOp = xx               aluControl = xxxx
```
