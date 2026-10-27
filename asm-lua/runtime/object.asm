; object.asm — native object helpers
; Target: Linux x86-64, NASM

BITS 64
DEFAULT REL

%include "object.inc"

global object_init

section .text

; object_init(RDI=object, RSI=type_id, RDX=method_table)
; Initializes a caller-allocated object header.
object_init:
    test rdi, rdi
    jz .error
    mov [rdi + ObjectHeader.type_id], rsi
    mov qword [rdi + ObjectHeader.flags], OBJECT_FLAG_ALIVE
    mov qword [rdi + ObjectHeader.ref_count], 1
    mov [rdi + ObjectHeader.method_table], rdx
    xor eax, eax
    ret
.error:
    mov eax, 1
    ret
