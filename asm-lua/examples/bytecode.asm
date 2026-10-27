; bytecode.asm — minimal VM invocation example
; Target: Linux x86-64, NASM

BITS 64
DEFAULT REL

%include "../vm/vm.inc"

global _start
extern vm_run

section .text
_start:
    lea rdi, [rel program]
    mov esi, program_end - program
    call vm_run

    mov edi, eax
    mov eax, 60
    syscall

section .rodata
program:
    dd OP_HALT
program_end:
