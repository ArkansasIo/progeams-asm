# Contributing

## Adding a program

1. Place source under a directory named for the target architecture or platform.
2. Add a README describing requirements, assembler command, run command, and expected output.
3. Comment non-obvious instructions and calling conventions; avoid commenting every obvious line.
4. Include register, memory, ABI, and operating-mode assumptions.
5. Keep generated binaries and temporary files out of Git.

## Naming and style

- Use descriptive lowercase file names.
- Prefer labels that describe intent (for example, `write_stdout` rather than `label1`).
- Define constants rather than repeating unexplained numeric values.
- Document external symbols and system calls.
- Make error paths explicit where practical.

## Portability

Assembly is target-specific. Do not present code as portable unless it has been tested with each claimed assembler, CPU mode, operating system, and linker.

## Tests

When adding runnable code, include a reproducible test or a manual verification procedure. A test should state required tools and expected exit status or output.
