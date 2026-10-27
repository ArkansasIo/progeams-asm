; vm.asm — initial ASM-Lua VM skeleton
; Target: Linux x86-64, NASM
;
; This file provides the dispatch-loop foundation. The public entry point
; vm_run accepts RDI = bytecode pointer and RSI = bytecode word count.

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

    mov r12, rdi            ; bytecode pointer
    mov r13, rsi            ; instruction count
    xor rbx, rbx            ; instruction index

.dispatch:
    cmp rbx, r13
    jae .success

    mov eax, [r12 + rbx*4]
    mov edx, eax
    and eax, 0xFF           ; opcode
    shr edx, 8              ; operand

    cmp eax, OP_HALT
    je .success
    cmp eax, OP_NOP
    je .next
    ; Other opcodes are added as runtime modules are implemented.
    ; Unknown instructions fail closed.
    jmp .invalid

.next:
    inc rbx
    jmp .dispatch

.success:
    xor eax, eax
    jmp .done

.invalid:
    mov eax, 1

.done:
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret

vm_halt:
    xor eax, eax
    ret

section .rodata

; Kept here so the VM can be extended without changing its external ABI.
