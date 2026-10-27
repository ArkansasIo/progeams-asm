# Assembly Program Catalogue

This catalogue is a broad, extensible checklist of common assembly-language program families. It is not a claim that every possible assembly program can be enumerated: programs are combinations of algorithms, operating-system services, hardware interfaces, and application domains. Examples must always specify their target CPU, assembler syntax, object format, runtime, and operating environment.

## 1. Minimal programs and console I/O

- [ ] Empty program / entry point
- [ ] Exit with status code
- [ ] Hello world
- [ ] Print a string
- [ ] Print a character
- [ ] Print an integer
- [ ] Print hexadecimal / binary / octal values
- [ ] Read one character
- [ ] Read a line
- [ ] Parse an integer
- [ ] Format numbers and strings
- [ ] Standard input/output/error
- [ ] Command-line argument parsing
- [ ] Environment-variable access
- [ ] File redirection
- [ ] Error messages and diagnostic output

## 2. Arithmetic, logic, and numeric routines

- [ ] Integer add, subtract, multiply, divide
- [ ] Signed and unsigned arithmetic
- [ ] Negation, absolute value, compare
- [ ] Bitwise AND, OR, XOR, NOT
- [ ] Bit shifts and rotates
- [ ] Bit masks and bit fields
- [ ] Set/test/clear a bit
- [ ] Count set bits / leading zeros / trailing zeros
- [ ] Min/max/clamp
- [ ] Overflow and carry handling
- [ ] Fixed-point arithmetic
- [ ] Floating-point arithmetic (where supported)
- [ ] Decimal/binary/hex conversion
- [ ] GCD / LCM
- [ ] Factorial
- [ ] Fibonacci sequence
- [ ] Prime testing and prime generation
- [ ] Integer exponentiation
- [ ] Square root approximation
- [ ] Polynomial evaluation
- [ ] Trigonometric approximations
- [ ] Random-number generator
- [ ] Checksums and cyclic redundancy checks (CRC)

## 3. Algorithms and data structures

- [ ] Linear and binary search
- [ ] Bubble, selection, insertion, merge, quick, and heap sort
- [ ] Stack
- [ ] Queue and circular queue
- [ ] Deque
- [ ] Linked list
- [ ] Hash table
- [ ] Set and map
- [ ] Binary tree / binary search tree
- [ ] Heap / priority queue
- [ ] Trie
- [ ] Graph representation
- [ ] Breadth-first and depth-first traversal
- [ ] Dijkstra shortest path
- [ ] A* pathfinding
- [ ] Disjoint-set / union-find
- [ ] Dynamic arrays
- [ ] String builder
- [ ] Memory pool / arena allocator
- [ ] Serialization and deserialization

## 4. Memory, CPU, and low-level runtime

- [ ] Register and flag inspection examples
- [ ] Register save/restore
- [ ] Stack-frame creation and teardown
- [ ] Calling-convention demonstration
- [ ] Function calls and returns
- [ ] Indirect calls and jump tables
- [ ] Interrupt / exception examples for an explicitly named target
- [ ] Memory copy and fill
- [ ] Memory compare
- [ ] Alignment and padding examples
- [ ] Endianness detection and conversion
- [ ] Atomic operations where supported
- [ ] Lock / spinlock demonstration
- [ ] Context-switch concepts (controlled environment only)
- [ ] Runtime startup and shutdown
- [ ] Minimal allocator
- [ ] Debug assertions and trap handlers
- [ ] Profiling timers and cycle-count measurements where available

## 5. Operating-system and file programs

- [ ] Open, read, write, close a file
- [ ] Create, rename, delete, and inspect files
- [ ] Directory listing
- [ ] File metadata
- [ ] Memory-mapped files
- [ ] Process launch and wait
- [ ] Exit codes
- [ ] Pipes
- [ ] Signals or equivalent OS notifications
- [ ] Shared libraries / dynamic loading
- [ ] Socket creation and teardown
- [ ] TCP client and server
- [ ] UDP sender and receiver
- [ ] DNS lookup through OS APIs
- [ ] HTTP request client (with a parser/library boundary)
- [ ] Configuration file reader
- [ ] Logging system
- [ ] Command interpreter / shell
- [ ] File copy utility
- [ ] Text search utility
- [ ] Archive/container reader
- [ ] Executable format inspection

These examples are operating-system-specific; syscall numbers and ABI conventions must not be copied between Linux, Windows, macOS, DOS, or other systems.

## 6. Text processing, language tools, and scripting

- [ ] Character classification
- [ ] String length, copy, compare, search
- [ ] Tokenizer / lexer
- [ ] Recursive-descent parser
- [ ] Pratt expression parser
- [ ] Abstract syntax tree (AST)
- [ ] Bytecode assembler
- [ ] Bytecode disassembler
- [ ] Stack-based virtual machine
- [ ] Register-based virtual machine
- [ ] Compiler front end
- [ ] Intermediate representation (IR)
- [ ] Constant folding
- [ ] Dead-code analysis
- [ ] Register allocation demonstration
- [ ] Assembly code generator
- [ ] Symbol table
- [ ] Macro processor
- [ ] Embedded Lua-like interpreter
- [ ] REPL (read-eval-print loop)
- [ ] Script module loader
- [ ] Script debugging hooks
- [ ] Script profiler
- [ ] Foreign-function interface (FFI) boundary

## 7. Object-oriented programming runtime patterns

Assembly itself does not require classes, but classes can be implemented with data layouts, function pointers, and conventions. These examples demonstrate a runtime design, not a built-in assembly-language feature.

- [ ] Object allocation and initialization
- [ ] Object destruction / cleanup
- [ ] Structs and records
- [ ] Encapsulation by API convention
- [ ] Methods receiving a `self` pointer
- [ ] Constructors and factories
- [ ] Single inheritance via base-object layout
- [ ] Virtual method tables (vtables)
- [ ] Interfaces / protocol tables
- [ ] Composition and delegation
- [ ] Properties / getters and setters
- [ ] Static/class-level methods
- [ ] Reference counting
- [ ] Handle-based object registry
- [ ] Generational handles to detect stale references
- [ ] Event callbacks
- [ ] Signals and slots
- [ ] Component-based entities
- [ ] Reflection metadata
- [ ] Runtime type identifiers
- [ ] Serialization of object graphs
- [ ] Object pools
- [ ] Exception or error-result convention
- [ ] Unit tests for object dispatch and lifetime

## 8. Lua-like scripting language and virtual machine

Proposed project name: **ASM-Lua** (working name only). This describes a small Lua-inspired language that compiles to bytecode and runs in an assembly-written VM. It is not official Lua and is not guaranteed to be Lua-compatible.

### Proposed language features

- [ ] `local` variables
- [ ] Numbers, booleans, strings, and nil-like value
- [ ] Arithmetic and comparisons
- [ ] `if / elseif / else / end`
- [ ] `while / do / end`
- [ ] Numeric `for` loops
- [ ] Functions and return values
- [ ] Lexical scopes and closures (later milestone)
- [ ] Tables as arrays/maps (later milestone)
- [ ] Modules and `require`-like loading
- [ ] Error values and protected calls
- [ ] Host functions exposed by the assembly runtime
- [ ] Object syntax through tables/metatables or a small class helper
- [ ] Debug print and tracebacks
- [ ] Bytecode dump tool

### Example script

```lua
local Entity = {}

function Entity.new(name, hp)
    local self = {
        name = name,
        hp = hp,
    }

    function self:damage(amount)
        self.hp = self.hp - amount
        if self.hp < 0 then
            self.hp = 0
        end
    end

    function self:is_alive()
        return self.hp > 0
    end

    return self
end

local hero = Entity.new("Aster", 100)
hero:damage(25)
print(hero.name, hero.hp, hero:is_alive())
```

The snippet expresses a Lua-style object using tables and methods. A minimal first version can implement only the language subset listed in the VM milestone plan; closures, tables, and method-call sugar require explicit runtime support.

## 9. Graphics, multimedia, and games

- [ ] Text-mode screen output
- [ ] Pixel/framebuffer clear
- [ ] Draw pixel, line, rectangle, and sprite
- [ ] Bitmap font renderer
- [ ] Tile-map renderer
- [ ] Sprite animation
- [ ] Keyboard input polling
- [ ] Mouse input (platform-specific)
- [ ] Audio tone generation on a defined platform
- [ ] PCM audio buffer processing
- [ ] Game loop / fixed timestep
- [ ] Collision checks
- [ ] Entity-component-system (ECS) core
- [ ] Input mapping
- [ ] Scene/object registry
- [ ] Save/load game state
- [ ] Basic 2D physics
- [ ] Deterministic random seed handling
- [ ] Simple terminal game
- [ ] Retro-console ROM example, with target-specific linker script and memory map
- [ ] Software rasterizer
- [ ] Shader or GPU command submission bridge (platform-specific)

## 10. Embedded systems and hardware I/O

- [ ] Reset/startup code for a named microcontroller
- [ ] GPIO input/output
- [ ] LED blink
- [ ] Button debounce
- [ ] Timer interrupt
- [ ] PWM control
- [ ] UART transmit/receive
- [ ] SPI transfer
- [ ] I²C transaction
- [ ] ADC read
- [ ] Watchdog setup
- [ ] Ring-buffered device input
- [ ] Finite-state machine
- [ ] Bootloader / firmware update protocol
- [ ] Memory-mapped peripheral access
- [ ] Sensor driver
- [ ] Display driver
- [ ] Motor control demonstration
- [ ] Basic protocol framing and checksum

Hardware programs require the exact chip datasheet, clock tree, pin mappings, memory map, and safety limits. Do not run actuator or power-control code on hardware without appropriate safeguards.

## 11. Retro computing and CPU-family examples

Create separate subdirectories and toolchain notes for each target:

- [ ] x86 16-bit real mode / DOS
- [ ] x86-64 Linux ELF
- [ ] x86-64 Windows PE (NASM/MASM syntax as appropriate)
- [ ] ARM32 / AArch64
- [ ] RISC-V
- [ ] MOS 6502
- [ ] NES 6502 variant / console environment
- [ ] Atari 8-bit 6502 environment
- [ ] Zilog Z80
- [ ] Game Boy LR35902
- [ ] Motorola 68000
- [ ] MIPS
- [ ] PowerPC
- [ ] IBM System/360 / z/Architecture
- [ ] AVR
- [ ] PIC family
- [ ] 8051
- [ ] MSP430
- [ ] WebAssembly text/binary as a related low-level target

Each family has different opcodes, registers, conventions, and tooling. A source file for one target should not be labelled as runnable on another without a port.

## 12. Security, reliability, and diagnostic examples

- [ ] Bounds-checking demonstration
- [ ] Safe parsing of untrusted input
- [ ] Integer overflow tests
- [ ] Stack canary concept
- [ ] Address and length validation
- [ ] Permission-aware file operations
- [ ] Cryptographic hash via a vetted implementation or library boundary
- [ ] Randomness API boundary
- [ ] Constant-time comparison concept
- [ ] Fuzz harness for parser code
- [ ] Unit test runner
- [ ] Integration test harness
- [ ] Crash log / fault record
- [ ] Binary inspector
- [ ] Disassembler for a documented toy ISA
- [ ] Emulator for a documented toy ISA

Security-sensitive algorithms should use reviewed implementations and platform facilities; handwritten assembly needs especially careful independent testing.

## 13. Developer tools and build automation

- [ ] Build script
- [ ] Makefile
- [ ] Linker script
- [ ] Symbol map generation
- [ ] Listing file generation
- [ ] Version string / build metadata
- [ ] Test runner
- [ ] Benchmark runner
- [ ] Documentation generator
- [ ] Source formatter/linter checks
- [ ] Emulator runner
- [ ] CI pipeline
- [ ] Release packaging
- [ ] Reproducible build check

## Suggested milestone order

1. **M0 — Build baseline:** hello world, print, exit, build scripts, CI.
2. **M1 — Runtime basics:** integer parsing/formatting, memory routines, calling convention, tests.
3. **M2 — Algorithms:** strings, stacks, queues, arrays, sorting/searching.
4. **M3 — Object model:** object layout, methods, vtable dispatch, handles, lifetime tests.
5. **M4 — Script front end:** lexer, parser, AST, error reporting.
6. **M5 — Bytecode VM:** values, arithmetic, locals, branches, function calls, stack traces.
7. **M6 — Lua-like features:** tables, modules, methods, closures when feasible.
8. **M7 — Host integration:** file/config APIs, logging, event callbacks, script sandbox limits.
9. **M8 — Target expansion:** additional CPU families and emulator/hardware examples.
10. **M9 — Apps:** CLI tools, games, embedded demos, and sample projects.

## Completion tracking

Use GitHub issues or individual task files to convert each checklist item into a scoped issue. For each implementation, record the target, tool versions, build command, test command, expected output, and current status.
