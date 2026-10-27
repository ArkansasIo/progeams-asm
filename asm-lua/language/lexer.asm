; lexer.asm — ASM-Lua lexer skeleton
; Target: Linux x86-64, NASM
;
; The production lexer will tokenize source into a caller-owned token buffer.
; This initial file defines the external ABI and whitespace classifier.

BITS 64
DEFAULT REL

global lexer_is_space

section .text

; lexer_is_space(AL=ASCII byte) -> AL=1 if space/tab/newline/CR, else 0
lexer_is_space:
    cmp al, ' '
    je .yes
    cmp al, 9
    je .yes
    cmp al, 10
    je .yes
    cmp al, 13
    je .yes
    xor eax, eax
    ret
.yes:
    mov eax, 1
    ret
