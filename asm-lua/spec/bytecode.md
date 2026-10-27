# ASM-Lua Bytecode v0

Bytecode is a sequence of fixed-width instructions for the first VM prototype. The exact binary packing is provisional.

## Instruction model

Each instruction has an opcode and zero or more operands. The prototype uses a 32-bit instruction word with the low byte as opcode and the remaining bytes as an unsigned operand.

| Opcode | Name | Meaning |
|---:|---|---|
| 0x00 | HALT | Stop execution successfully |
| 0x01 | CONST | Push constant at index |
| 0x02 | LOAD | Push local slot |
| 0x03 | STORE | Store top value into local slot |
| 0x04 | ADD | Integer addition |
| 0x05 | SUB | Integer subtraction |
| 0x06 | MUL | Integer multiplication |
| 0x07 | DIV | Integer division |
| 0x08 | NEG | Integer negation |
| 0x09 | EQ | Compare two values |
| 0x0A | LT | Less-than comparison |
| 0x0B | JMP | Relative jump |
| 0x0C | JZ | Relative jump if zero/false |
| 0x0D | CALL | Call function/value |
| 0x0E | RET | Return |
| 0x0F | POP | Discard stack top |
| 0x10 | PRINT | Development host output |

## Value representation

The first VM supports signed 64-bit integers and a small tagged representation for boolean and nil values. The exact tag layout belongs in `runtime/value.inc` and must remain consistent with the VM.

## Errors

Malformed bytecode, invalid operands, stack underflow, stack overflow, invalid local indexes, division by zero, and excessive call depth must terminate the current script with a structured error rather than jumping through arbitrary memory.

## Versioning

Bytecode files must carry a magic value and version before being considered a stable interchange format. Version 0 is an internal development format only.
