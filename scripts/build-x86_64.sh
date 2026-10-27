#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD_DIR="$ROOT_DIR/build"

command -v nasm >/dev/null 2>&1 || {
    echo "Error: NASM is required (nasm -v)." >&2
    exit 1
}
command -v ld >/dev/null 2>&1 || {
    echo "Error: ld is required to link the ELF executable." >&2
    exit 1
}

case "$(uname -s):$(uname -m)" in
    Linux:x86_64) ;;
    *)
        echo "Error: this example targets Linux x86-64." >&2
        echo "Detected: $(uname -s) / $(uname -m)" >&2
        exit 2
        ;;
esac

mkdir -p "$BUILD_DIR"
nasm -f elf64 "$ROOT_DIR/examples/x86_64/hello.asm" -o "$BUILD_DIR/hello.o"
ld -o "$BUILD_DIR/hello" "$BUILD_DIR/hello.o"
"$BUILD_DIR/hello"
