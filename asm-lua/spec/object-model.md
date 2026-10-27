# ASM-Lua Object Model

The scripting layer uses table-like objects. Native assembly objects use opaque handles rather than exposing raw pointers to scripts.

## Native object layout

Conceptual layout:

```text
ObjectHeader
  type_id       ; runtime type identifier
  flags         ; lifecycle/state flags
  ref_count     ; optional ownership count
  method_table  ; pointer to native dispatch table
  payload       ; type-specific data
```

A method receives an explicit `self`/object pointer or validated handle. Constructors initialize every field before publication. Destructors release owned resources exactly once.

## Dispatch

The first implementation uses a method table:

```text
method_table[method_id] -> native function
```

The VM should validate the object type and method identifier before indirect dispatch. Do not let script-controlled integers become unchecked native function pointers.

## Script objects

Lua-like tables provide the first object abstraction:

```lua
local Player = {}

function Player.new(name)
    return { name = name, hp = 100 }
end

function Player:damage(amount)
    self.hp = self.hp - amount
end
```

Inheritance is intentionally deferred. Composition and delegation can be implemented without changing the core VM calling convention.
