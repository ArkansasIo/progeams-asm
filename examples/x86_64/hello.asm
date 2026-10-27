; hello.asm — Linux x86-64, NASM syntax.
; Build: nasm -f elf64 examples/x86_64/hello.asm -o build/hello.o
; Link:  ld -o build/hello build/hello.o
; Run:   ./build/hello

BITS 64
DEFAULT REL

global _start

section .rodata
message:     db "Hello from NASM x86-64!", 10
message_len: equ $ - message

section .text
_start:
    ; write(1, message, message_len)
    mov     eax, 1              ; Linux x86-64 SYS_write
    mov     edi, 1              ; stdout
    lea     rsi, [rel message]
    mov     edx, message_len
    syscall

    ; Exit successfully. This tiny example intentionally does not retry
    ; partial writes; production code should check syscall return values.
    mov     eax, 60             ; Linux x86-64 SYS_exit
    xor     edi, edi
    syscall
