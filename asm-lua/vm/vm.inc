; vm.inc — ASM-Lua VM definitions

%define VM_STACK_SIZE 1024
%define VM_LOCALS_SIZE 256

%define OP_HALT  0x00
%define OP_CONST 0x01
%define OP_LOAD  0x02
%define OP_STORE 0x03
%define OP_ADD   0x04
%define OP_SUB   0x05
%define OP_MUL   0x06
%define OP_DIV   0x07
%define OP_NEG   0x08
%define OP_EQ    0x09
%define OP_LT    0x0A
%define OP_JMP   0x0B
%define OP_JZ    0x0C
%define OP_CALL  0x0D
%define OP_RET   0x0E
%define OP_POP   0x0F
%define OP_PRINT 0x10
