# Data Structures

## Lists

- Linked Lists

- Immutable

- `[]`

- `length` for linear

## Tuples

- Contiguous memory

- Immutable

- `{}`

- `put_elem`

- `size` for constant time

### Tagged Tuples

- `tuples` and `atoms` combined

  - two-element tuples usually

Eg: `File.read("path/to/existing/file")`

---

## Strings

- `byte_size`
- `String.length`, `String.codepoints`, `String.graphemes`
- Uses `<>` for concatenation
- Use `to_string` to convert int, floats, charlists to string

### Bitstrings and Binaries

- Denoted using `<<>>`

- Can optionally provide size using `::<size>` or `::size(<number>)`

- A binary is a bitstring where the number of bits is divisible by 8.

- `is_binary`, `is_bitstring`

### Charlists

- `~c` is a sigil

- Uses `++` for concatenation

---

## Keyword Lists

- used to pass options to functions

- Eg: `String.split([trim: true])`

- `[{:trim, true}] == [trim: true]`

- Characteristics of keyword lists

  - Keys must be atoms.

  - Keys are ordered, as specified by the developer.

  - Keys can be given more than once.

- Ecto eg:

```elixir
query =
  from w in Weather,
    where: w.prcp > 0,
    where: w.temp < 20,
    select: w
```

- Pattern matching is impractical though supported

- `do` is also keyword lists

---

## [Syntax](https://hexdocs.pm/elixir/optional-syntax.html)

- `if`

- `defmodule`

---

## Maps

- `%{}` is used for defining maps

- Differences to Keyword lists
  - Maps allow any value as a key.
  - Maps' keys do not follow any ordering.

- Related module: [Access](https://hexdocs.pm/elixir/1.13/Access.html)

### Map with predefined keys

- new keys are never added nor removed

- values may be updated

---

## Nested Data Structures

- `put_in`

- `update_in` - allows us to pass a function that controls how the value changes
