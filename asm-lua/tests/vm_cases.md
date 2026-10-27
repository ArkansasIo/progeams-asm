# VM Test Cases

## TC-001 HALT

Bytecode:

```text
HALT
```

Expected result: VM returns exit status 0.

## TC-002 empty program

Bytecode length: zero.

Expected result: VM returns 0 because instruction pointer reaches the end of the program.

## TC-003 invalid opcode

Bytecode:

```text
0xFF
```

Expected result: VM returns non-zero and does not execute an indirect address.

## TC-004 object initialization

Allocate an `ObjectHeader`, call `object_init`, and verify type ID, alive flag, reference count, and method table.

## TC-005 invalid object

Call `object_init` with a null object pointer.

Expected result: non-zero error code and no memory write.

## Future tests

- constants
- integer arithmetic
- locals
- conditional branches
- function calls
- return values
- tables
- method calls
- parser error locations
- instruction-budget enforcement
- stack overflow protection
