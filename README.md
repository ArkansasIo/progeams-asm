# Assembly Programs Laboratory

A collection of small, documented assembly-language programs and learning projects. This repository starts with a portable structure and adds platform-specific examples as the project grows.

## Goals

- Keep each program small, independently buildable, and documented.
- Separate source code by target architecture and assembler.
- Include build/run instructions and expected behavior for each example.
- Add automated checks for source formatting and buildable examples where toolchains are available.

## Repository layout

```text
.
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── .gitignore
├── docs/
│   ├── architecture.md
│   └── toolchains.md
├── examples/
│   ├── x86_64/
│   │   └── hello.asm
│   └── 6502/
│       └── README.md
├── scripts/
│   └── build-x86_64.sh
└── tests/
    └── README.md
```

## Quick start

### x86-64 example (NASM + Linux)

Install NASM and a C toolchain/linker using your operating system's package manager, then run:

```sh
./scripts/build-x86_64.sh
```

The script assembles and links `examples/x86_64/hello.asm` into a local executable named `build/hello`, then runs it. This example targets Linux x86-64 and is not intended for Windows or macOS without changes.

## Supported targets

The initial example is NASM x86-64 for Linux. The 6502 directory is reserved for future emulator or retro-hardware examples. Each new target should document its assembler version, CPU assumptions, output format, and execution environment.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for source and documentation conventions. Never commit generated binaries, local build output, or credentials.
