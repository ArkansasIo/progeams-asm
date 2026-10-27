; oop.asm — explicit object + method-table pattern
; Target: Linux x86-64, NASM
;
; This is a teaching example of OOP conventions implemented directly in ASM.

BITS 64
DEFAULT REL

%include "../runtime/object.inc"

global demo_object_layout

global demo_method_dispatch

section .text

; demo_object_layout(RDI=object)
; Returns 0 when the object header looks initialized.
demo_object_layout:
    test rdi, rdi
    jz .bad
    cmp qword [rdi + ObjectHeader.flags], OBJECT_FLAG_ALIVE
    jne .bad
    cmp qword [rdi + ObjectHeader.ref_count], 1
    jb .bad
    xor eax, eax
    ret
.bad:
    mov eax, 1
    ret

; demo_method_dispatch(RDI=method_table, RSI=method_id, RDX=self)
; A bounded dispatch example. Method-table entries are 8-byte function pointers.
demo_method_dispatch:
    test rdi, rdi
    jz .bad
    cmp rsi, 64
    jae .bad
    mov rax, [rdi + rsi*8]
    test rax, rax
    jz .bad
    mov rdi, rdx
    call rax
    ret
.bad:
    mov eax, 1
    ret
