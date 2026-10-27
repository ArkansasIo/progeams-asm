# Toolchain Setup

## NASM x86-64 on Linux

Required tools:

- NASM assembler.
- A linker capable of producing a Linux x86-64 ELF executable (the supplied script uses `ld`).
- Linux x86-64 to run the resulting program.

Check installations:

```sh
nasm -v
ld -v
uname -m
```

Build and execute:

```sh
./scripts/build-x86_64.sh
```

The initial example uses Linux x86-64 system-call conventions directly. It is not a Windows PE program, a macOS Mach-O program, or a DOS program.

## 6502-family targets

A future 6502 example must name its specific target (for example, NMOS 6502, NES, or Atari 8-bit), assembler, memory map, and execution environment. These systems are related but not interchangeable; a program needs the correct reset/entry convention and target-specific I/O addresses.
