; vm.asm — initial ASM-Lua VM skeleton
; Target: Linux x86-64, NASM
;
; vm_run accepts RDI = bytecode pointer and RSI = bytecode word count.
; v0 currently implements HALT and a no-op extension opcode.

BITS 64
DEFAULT REL

%include "vm.inc"

global vm_run
global vm_halt

section .text

vm_run:
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13

    mov r12, rdi
    mov r13, rsi
    xor rbx, rbx

.dispatch:
    cmp rbx, r13
    jae .success

    mov eax, [r12 + rbx*4]
    and eax, 0xFF

    cmp eax, OP_HALT
    je .success

    ; 0x11 is reserved as a future NOP in the prototype.
    cmp eax, 0x11
    je .next

    ; Unknown instructions fail closed.
    mov eax, 1
    jmp .done

.next:
    inc rbx
    jmp .dispatch

.success:
    xor eax, eax

.done:
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret

vm_halt:
    xor eax, eax
    ret
