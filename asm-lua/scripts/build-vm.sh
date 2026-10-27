#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD_DIR="$ROOT_DIR/build"

command -v nasm >/dev/null 2>&1 || { echo "Error: NASM is required." >&2; exit 1; }
command -v ld >/dev/null 2>&1 || { echo "Error: ld is required." >&2; exit 1; }

case "$(uname -s):$(uname -m)" in
    Linux:x86_64) ;;
    *) echo "Error: ASM-Lua VM currently targets Linux x86-64." >&2; exit 2 ;;
esac

mkdir -p "$BUILD_DIR"

nasm -f elf64 "$ROOT_DIR/vm/vm.asm" -o "$BUILD_DIR/vm.o"
nasm -f elf64 "$ROOT_DIR/examples/bytecode.asm" -o "$BUILD_DIR/bytecode.o"
ld -o "$BUILD_DIR/asm-lua-vm" "$BUILD_DIR/bytecode.o" "$BUILD_DIR/vm.o"

"$BUILD_DIR/asm-lua-vm"
