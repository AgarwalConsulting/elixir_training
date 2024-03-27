# Extensibility

## Custom Sigils

- Sigils in Elixir are extensible

- `~r/foo/i` is equivalent to calling `sigil_r`

---

We can also provide our own sigils by implementing functions that follow the `sigil_{character}` pattern.

---

```elixir
defmodule MySigils do
  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: -String.to_integer(string)
end

import MySigils

~i(13)
13

~i(42)n

-42
```

---

Sigils can also be used to do compile-time work with the help of macros. For example, regular expressions in Elixir are compiled into an efficient representation during compilation of the source code, therefore skipping this step at runtime.

---

## Macros

## DSLs
