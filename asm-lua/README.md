# ASM-Lua Runtime

ASM-Lua is a small Lua-inspired scripting runtime implemented as a staged assembly project.

## Structure

```text
asm-lua/
├── README.md
├── spec/
│   ├── bytecode.md
│   └── object-model.md
├── vm/
│   ├── vm.inc
│   └── vm.asm
├── runtime/
│   ├── value.inc
│   ├── object.inc
│   └── object.asm
├── language/
│   ├── tokens.md
│   ├── lexer.asm
│   └── parser.asm
├── scripts/
│   └── hello.lua
├── examples/
│   ├── oop.asm
│   └── bytecode.asm
└── tests/
    └── vm_cases.md
```

The initial implementation deliberately starts with a small, testable subset rather than attempting to reproduce the complete Lua VM in one step.

## Initial target

NASM x86-64, Linux ELF. The bytecode specification is target-independent; the VM implementation is target-specific.

## Build direction

The first runnable milestone is a native VM that can execute constants, arithmetic, locals, branches, calls, returns, and host-print operations. The lexer/parser can then compile the Lua-like source language into that bytecode.
