# Flow Control

## `case`

```elixir
case pattern do
  matcher1 ->
    clause1
  matcher2 ->
    clause2
  _ ->
    catch_all_clause
end
```

- Pair with `^` to pin the value of a variable while matching.

- Matchers can have guards along with it. Eg: `<matcher> when <condition>`
  - `<condition>` may error out, causing the match arm to fail

- If none of the clauses match, an error is raised

## `cond`

```elixir
cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end
```

- Allows for branching across multiple conditions

- If all of the conditions return nil or false, an error `CondClauseError` is raised.
  - it may be necessary to add a final condition, equal to `true`, which will always match

- considers any value besides `nil` and `false` to be true

## `if`/`unless`

- `if` and `unless` are macros

```elixir
if nil do
  "This won't be seen"
else
  "This will"
end
```

```elixir
unless true do
  "This will never be seen"
end
```

## Range & Comprehensions

- `start..end//step`

- `for i <- 1..10`

- Can use comprehensions on other data types too

- Comprehensions are a syntactic sugar
