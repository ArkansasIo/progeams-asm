# Token Set

## Keywords

`local`, `function`, `end`, `if`, `then`, `elseif`, `else`, `while`, `do`, `return`, `true`, `false`, `nil`, `and`, `or`, `not`

## Literals

- decimal integers
- quoted strings
- boolean literals
- nil

## Operators

`+ - * / % == ~= < <= > >= =`

## Delimiters

`( ) { } [ ] , . : ;`

The lexer must preserve line and column information so parser and VM errors can report useful source locations.
