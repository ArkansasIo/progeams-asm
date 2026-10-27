# ASM-Lua: Lua-Inspired Language on an Assembly Runtime

**Status:** Draft design proposal  
**Compatibility:** Lua-inspired, not Lua-compatible  
**Goal:** Provide a small scripting language implemented by an assembly-language runtime, with data tables, functions, objects-by-convention, and a compact bytecode VM.

## 1. Design principles

1. Keep the first interpreter small and debuggable.
2. Separate the language front end from the VM and host APIs.
3. Define a portable bytecode specification before optimizing for a specific CPU.
4. Keep object-oriented features as a library/convention built on tables and methods, rather than requiring a complicated class system in the parser.
5. Put OS calls behind named host functions so the VM can be ported across operating systems.
6. Never execute arbitrary native machine code merely because a script contains a value or string.

## 2. Source language outline

### Values

First milestone values:

- nil-like value
- boolean
- signed integer
- number (later, a defined floating-point representation)
- string
- function reference

Later milestones:

- table/map/array
- closure
- host object handle

### Statements

```lua
local x = 42

if x >= 40 then
    print("large")
else
    print("small")
end

while x > 0 do
    x = x - 1
end

function add(a, b)
    return a + b
end
```

The initial parser should support local declarations, assignments, expressions, if/else, while, function declaration, function calls, and return. Add tables, numeric for loops, modules, and closures only after the core VM passes tests.

## 3. Object-oriented convention

The preferred Lua-inspired first object model uses a table as an object and functions stored in that table as methods:

```lua
local Vector2 = {}

function Vector2.new(x, y)
    return { x = x, y = y }
end

function Vector2.length(self)
    return math.sqrt(self.x * self.x + self.y * self.y)
end

local p = Vector2.new(3, 4)
print(Vector2.length(p))
```

A later syntax sugar layer may support colon methods:

```lua
function object:method(arg)
    -- equivalent to storing a function where self is argument 1
end

object:method(10) -- equivalent to object.method(object, 10)
```

Avoid designing inheritance into the parser. Prototype lookup or explicit delegation can be added once tables and method calls are reliable.

## 4. Components

### Lexer

Converts source bytes into tokens, tracks line and column, rejects malformed literals, and recognizes keywords/operators.

Suggested token groups:

- identifiers and keywords
- integer/number literals
- quoted strings and escape sequences
- punctuation: parentheses, braces, comma, dot, colon
- operators: + - * / %, == ~= < <= > >=, and, or, not
- assignment and statement separators if needed

### Parser

A Pratt parser is suitable for expressions because operator precedence can be defined in a compact table. Use recursive-descent functions for statements and blocks.

### AST / compiler

The first version can compile AST nodes to bytecode. To simplify debugging, start with a stack-based VM. Optimize only after correctness tests exist.

### Bytecode VM

Proposed initial instructions:

| Opcode | Purpose |
|---|---|
| CONST | Push a constant |
| NIL / TRUE / FALSE | Push a primitive value |
| LOAD_LOCAL | Read a local slot |
| STORE_LOCAL | Write a local slot |
| ADD / SUB / MUL / DIV / MOD | Arithmetic |
| NEG / NOT | Unary operation |
| EQ / LT / LE | Comparison |
| JMP / JMP_IF_FALSE | Control flow |
| CALL | Call a function |
| RETURN | Return from function |
| POP | Discard stack top |
| PRINT (development only) | Debug output; replace with a host API in production |

This table is a proposal. Opcode widths, operand encoding, stack limits, calling convention, error behaviour, and bytecode version must be fixed in a separate VM specification before binary bytecode files are considered stable.

## 5. Object model options

### Option A — Table + method convention (recommended first)

- Objects are tables/maps.
- Methods are functions stored in tables.
- No hidden class metadata is required.
- Composition and delegation are straightforward.
- Closures and metamethod-style lookup can wait.

### Option B — Explicit class descriptors

- A class descriptor points to method tables and optionally a parent class.
- Instances carry a class/descriptor handle.
- Method dispatch searches the descriptor chain.
- Faster structured dispatch is possible, but object lifetime and inheritance rules become more complex.

### Option C — Native assembly objects

- Each native object has a fixed header and function-pointer table.
- Host APIs expose opaque handles to scripts.
- Use only for host/runtime objects; do not allow scripts to forge arbitrary native pointers.

Begin with Option A and expose only narrow host functions. Keep Option B as a possible later extension.

## 6. Error model

Errors should include a category, source filename, line number, and readable message. Avoid uncontrolled jumps from a deep parser/VM frame. The interpreter should return a structured error to its caller; a CLI host can print it and exit non-zero.

Examples of errors:

- unexpected token
- undefined local
- type mismatch
- division by zero
- stack overflow
- too many function arguments
- invalid bytecode
- host API failure
- instruction budget exceeded

## 7. Safety limits

- Add a maximum source size and maximum token count.
- Bound VM stack and call depth.
- Provide an instruction budget for scripts.
- Make filesystem and network APIs opt-in host capabilities.
- Never expose raw native pointers to untrusted scripts.
- Avoid loading bytecode from unknown sources without validation.
- Separate trusted project scripts from externally supplied scripts.

## 8. Testing

The language should have golden tests for token streams, parse trees, compiled bytecode, output, and error messages. Every grammar feature needs both success and failure cases. Add fuzz testing for the lexer/parser before accepting untrusted script input.
