# Tests and Verification

## NASM x86-64 hello example

On Linux x86-64 with NASM and binutils installed:

```sh
./scripts/build-x86_64.sh
```

Expected standard output:

```text
Hello from NASM x86-64!
```

Expected process exit code: `0`.

## Recommended CI checks

- Verify shell scripts with `sh -n scripts/build-x86_64.sh`.
- Assemble and link the NASM example on a Linux x86-64 runner.
- Run the executable and compare output with the expected line.
- For future cross-target sources, use an explicit assembler/emulator matrix and do not silently skip unsupported targets.
