# Functions

## Private functions

- `defp` vs `def`

## One liners

- `, do:` instead of the `do ... end` syntax

```elixir
def add(x, y), do: x+y
```

## Function Overloading & guard statements

```elixir
def greeting(name) do
  "Hello, " <> name
end
```

```elixir
def greeting(the_greeting, name) do
    the_greeting <> " " <> name
end
```

```elixir
def greeting(name) when name == "" do
  "Hello, World!"
end
```

## Default Arguments

- Default value can be provided using `<arg_name> \\ <arg_value>`

```elixir
def greeting(name, the_greeting \\ "hello") do
  the_greeting <> " " <> name
end
```

## Pattern Matching in args

- Can be used for destructuring

```elixir
def hello(%{name: person_name}), do: IO.puts "Hello, " <> person_name
```

## Anonymous Functions

```elixir
add = fn a, b -> a + b end
add.(1, 2)
```

- Can be created using `fn`
  - Followed by arguments and arrow notation `->`

- Have a closure property

  - Cannot rebind variables

- Can have pattern matching, clauses and guards, similar to `case`

## General

- capture functions using `&` prefixed before the `<function_name>/<arity>`

- Arguments can be denoted using `&<ordinal>`

## Recursion (instead of Loops)
