# Repository Architecture

## Organization

Sources are grouped by target, not merely by language extension, because assembler syntax and execution models differ.

- `examples/x86_64/`: NASM examples for Linux x86-64.
- `examples/6502/`: notes and future source for 6502-family targets.
- `scripts/`: reproducible build helpers.
- `tests/`: test plans, emulator checks, and automated validation.
- `docs/`: shared design and toolchain guidance.

## Example contract

Every executable example should document:

- CPU architecture and execution mode.
- Assembler, linker, and emulator/runtime versions where relevant.
- Entry point, calling convention, memory layout, and external dependencies.
- Build and run steps.
- Expected output and failure behavior.
- Whether it is safe to run on a host or requires an emulator.

## Engineering standards

Use explicit data sizes and signedness where relevant. Preserve registers required by the applicable ABI. Keep stack alignment correct at external call boundaries. Check system-call return values when a failure is meaningful. Prefer reproducible scripts over undocumented manual command sequences.
