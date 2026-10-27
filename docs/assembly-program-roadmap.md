# Assembly Runtime and Scripting Roadmap

This roadmap converts the catalogue into implementable increments for this repository.

## Repository policy

Every program should state: CPU target, assembler, object format, ABI/runtime assumptions, source path, build command, run/test command, and expected output. Keep platform-specific programs in separate directories.

## Work packages

### A. Core routines

- [ ] Exit status and console output
- [ ] Integer formatting and parsing
- [ ] String length / compare / copy
- [ ] Memory copy / fill / compare
- [ ] Input validation and error reporting
- [ ] Test harness and CI

### B. Algorithms and containers

- [ ] Dynamic array
- [ ] Stack and queue
- [ ] Linked list
- [ ] Hash table
- [ ] Sorting and searching
- [ ] Graph search and shortest path
- [ ] Allocator and bounds tests

### C. Assembly-level object model

- [ ] Define object layout
- [ ] Implement constructors/factories
- [ ] Implement method calls with explicit self pointer
- [ ] Add vtable or method-table dispatch example
- [ ] Add object registry with opaque integer handles
- [ ] Add lifecycle tests and stale-handle detection
- [ ] Document ABI and memory ownership

### D. ASM-Lua script engine

- [ ] Lexer
- [ ] Parser
- [ ] AST and source-location tracking
- [ ] Stack-based VM
- [ ] Integer/boolean/nil values
- [ ] Local variables and scopes
- [ ] If/while branches
- [ ] Functions and return values
- [ ] Table/map data type
- [ ] Object method syntax
- [ ] Module loader
- [ ] Host API registry
- [ ] Instruction budget and stack limits
- [ ] Debugger/trace output
- [ ] Language and VM test suite

### E. Platform expansion

- [ ] NASM x86-64 Linux
- [ ] Windows x86-64 (separate ABI and linker flow)
- [ ] ARM64
- [ ] RISC-V
- [ ] 6502-family examples, split by concrete machine
- [ ] Z80 and Game Boy examples
- [ ] Embedded MCU examples with exact chip and toolchain

## Definition of done

A checklist item is complete only when source exists, requirements and commands are documented, and a repeatable test succeeds on the stated target. A design document or stub does not count as an implementation.

## First practical release

The first releasable milestone should contain a buildable x86-64 Linux example, a handful of independently tested routines, a basic test runner, and the language design documents. The ASM-Lua VM should begin as a separate module once arithmetic, strings, function calls, errors, and automated tests are in place.
