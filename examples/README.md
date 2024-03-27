# General

## Execution

Compilation: `elixirc calculator.ex`; creates a `Elixir.Calculator.beam` bytecode file.

Scripting: `elixir scratchpad.exs`

## [Extension](https://hexdocs.pm/elixir/modules-and-functions.html#scripting-mode)

> In addition to the Elixir file extension `.ex`, Elixir also supports `.exs` files for scripting. Elixir treats both files exactly the same way, the only difference is in intention. `.ex` files are meant to be compiled while `.exs` files are used for scripting.

## [Hot Reloading](https://hexdocs.pm/iex/IEx.Helpers.html#recompile/0)

Start iex with mix (`iex -S mix`), then:

```elixir
IEx.Helpers.recompile
```

Or reload specific module using:

```elixir
r Greet
```

## Naming Conventions

`snake_case` - for variables, functions, attributes

  `_` - Unused

`PascalCase`/`UpperCamelCase` - Module names

### Function Naming Conventions

- `!` - Function can raise an exception or error

- `?` - Either holds or evaluates to a boolean true or false value
