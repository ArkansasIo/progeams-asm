; value.inc — provisional ASM-Lua value representation
; NASM x86-64

%define VAL_NIL       0
%define VAL_FALSE     1
%define VAL_TRUE      2
%define VAL_INT       3

; A full NaN-boxed or two-word representation can replace this later.
; The v0 VM keeps the representation intentionally simple.
