; parser.asm — ASM-Lua parser skeleton
; Target: Linux x86-64, NASM
;
; Parser implementation is staged after the lexer/token-buffer contract.
; This routine provides a stable placeholder ABI.

BITS 64

global parser_init

section .text

; parser_init(RDI=token_buffer, RSI=token_count)
parser_init:
    test rdi, rdi
    jz .error
    test rsi, rsi
    jz .error
    xor eax, eax
    ret
.error:
    mov eax, 1
    ret
