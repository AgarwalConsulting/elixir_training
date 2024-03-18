layout: true

.signature[@algogrit]

---

class: center, middle

# Elixir

Gaurav Agarwal

---
class: center, middle

## Compilation & Execution

---
class: center, middle

`elixirc <code>.ex` produces `Elixir.<ModuleName>.beam` bytecode file

---
class: center, middle

`elixir <code>.exs`

---

*Compilation*: `elixirc calculator.ex`; creates a `Elixir.Calculator.beam` bytecode file.

*Scripting*: `elixir scratchpad.exs`

---
class: center, middle

`.ex` vs `.exs`

---
class: center, middle

> In addition to the Elixir file extension `.ex`, Elixir also supports `.exs` files for scripting. Elixir treats both files exactly the same way, the only difference is in intention. `.ex` files are meant to be compiled while `.exs` files are used for scripting.

---

### [Hot Reloading](https://hexdocs.pm/iex/IEx.Helpers.html#recompile/0)

- Start iex with mix (`iex -S mix`), then:

```elixir
IEx.Helpers.recompile
```

- Or reload specific module using:

```elixir
r Greet
```

---
class: center, middle

## Naming Conventions

.content-credits[https://hexdocs.pm/elixir/naming-conventions.html]

---
class: center, middle

## Types

---
class: center, middle

Elixir is a dynamically-typed functional language running on the Erlang Virtual Machine

.content-credits[https://arxiv.org/abs/2306.06391]

---

### Basic Types

```elixir
1          # integer
0x1F       # integer
1.0        # float
true       # boolean
:atom      # atom / symbol
"elixir"   # String
[1, 2, 3]  # list
{1, 2, 3}  # tuple
```

---
class: center, middle

`atom` vs `String`

---

- Atoms are more efficient than strings in terms of memory usage and comparison as they are interned in a global atom table.

- An atom will be created only once in the atom table and any new atoms created with the same content will always refer to the previously created atom in the atom table.

---
class: center, middle

`nil`, `true`, `false` is atom?!

---
class: center, middle

yes

---
class: center, middle

## Operators

---

### Arithmetic

- `+`

- `-`

- `*`

- `/`

- `div`

- `rem`

- `**`

---

### String Operators

- `<>` concatenation

- `"#{<val>}"` interpolation

---

### Boolean

- `&&` vs `and`

- `||` vs `or`

- `!` vs `not`

---

### Comparison

- `==` vs `===`

- `>`, `<`, `>=`, `<=`

---
class: center, middle

### Structural vs Semantic

---

### Pattern Matching

- `=`

- `_`

- `|`

- `^`

---

- `=` is matching operator

- `_` to ignore

- [head | tail] = [1, 2, 3]

  - Can also be used for prepending/updating

- `^` is the pin operator

  - doesn't rebound the value, just matches

---
class: center, middle

## Flow Control

---

### `case`

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

---

- Pair with `^` to pin the value of a variable while matching.

- Matchers can have guards along with it. Eg: `<matcher> when <condition>`
  - `<condition>` may error out, causing the match arm to fail

- If none of the clauses match, an error is raised

---

### `cond`

```elixir
cond do
  <bool_statement> ->
    <expression>
  <bool_statement> ->
    <expression>
  <bool_statement> ->
    <expression>
end
```

---
class: center, middle

*Eg:*

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

---

- Allows for branching across multiple conditions

- If all of the conditions return nil or false, an error `CondClauseError` is raised.
  - it may be necessary to add a final condition, equal to `true`, which will always match

- considers any value besides `nil` and `false` to be true

---

### `if`/`unless`

- `if` and `unless` are macros

---

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

---
class: center, middle

## Range & Comprehensions

---
class: center, middle

`start..end//<step>`

---

- `for i <- 1..10`

- Can use comprehensions on other data types too
  - `for i <- <enumerable>`

- Comprehensions are a syntactic sugar

---
class: center, middle

`into:`

---
class: center, middle

Comprehensions support other options, such as `:reduce` and `:uniq`

.content-credits[https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1]

---
class: center, middle

## Data Structures

---
class: center, middle

### Lists

---

- Linked Lists

- Immutable

- `[]`

- `length` for linear

---

#### List Operators

- `++`

- `--`

- `hd`, `tl`

---
class: center, middle

### Tuples

---

- Contiguous memory

- Immutable

- `{}`

- `put_elem`

- `size` for constant time

---

#### Tagged Tuples

- `tuples` and `atoms` combined

  - two-element tuples usually

---
class: center, middle

*Eg*: `File.read("path/to/existing/file")`

---
class: center, middle

### String or `BitString`

---

- `byte_size`

- `String.length`, `String.codepoints`, `String.graphemes`

- Uses `<>` for concatenation

- Use `to_string` to convert int, floats, charlists to string

---
class: center, middle

#### Bitstrings and Binaries

---

- Denoted using `<<>>`

- Can optionally provide size using `::<size>` or `::size(<number>)`

---

- A binary is a bitstring where the number of bits is divisible by 8.

- `is_binary`, `is_bitstring`

---
class: center, middle

#### Charlists

---

- `~c` is a sigil

- Uses `++` for concatenation

---
class: center, middle

### Keyword Lists

---

- used to pass options to functions
  - Eg: `String.split([trim: true])`

- `[{:trim, true}] == [trim: true]`

---

Characteristics of keyword lists

- Keys must be atoms.

- Keys are ordered, as specified by the developer.

- Keys can be given more than once.

---
class: center, middle

*Ecto Eg:*

```elixir
query =
  from w in Weather,
    where: w.prcp > 0,
    where: w.temp < 20,
    select: w
```

---

- Pattern matching is impractical though supported

- `do` is also keyword lists

---
class: center, middle

## [Syntax](https://hexdocs.pm/elixir/optional-syntax.html)

---

*Eg:*

- `if`

- `defmodule`

---
class: center, middle

### Maps

---

- `%{}` is used for defining maps

- Differences to Keyword lists
  - Maps allow any value as a key.
  - Maps' keys do not follow any ordering.

---
class: center, middle

*Related module:* [Access](https://hexdocs.pm/elixir/Access.html)

---
class: center, middle

### Updating DS via Pattern Matching

---

#### Map with predefined keys

- new keys are never added nor removed

- values may be updated

---
class: center, middle

### Working with Nested Data Structures

---
class: center, middle

`put_in`

---
class: center, middle

`update_in`

allows us to pass a function that controls how the value changes

---
class: center, middle

## Enumerables vs Streams

---

### [Enumerables](https://hexdocs.pm/elixir/Enum.html)

- `map`

- `reduce`

- `filter`

- `sum`

- ...

---
class: center, middle

`|>`

---
class: center, middle

`for` is a syntactic sugar for `Enum.filter` + `Enum.map`

---
class: center, middle

#### Enum Cheat Sheet

.content-credits[https://hexdocs.pm/elixir/enum-cheat.html]

---

### [Streams](https://hexdocs.pm/elixir/Stream.html)

Supports lazy operations

- `map`

- `transform`

- `filter`

- `sum`

- `unfold`

- ...

---
class: center, middle

`Stream.cycle` + `Enum.take`

---
class: center, middle

`Stream.resource` vs `File.stream!`

---
class: center, middle

## Functions

---
class: center, middle

`defp` vs `def`

---
class: center, middle

`defp` is used for defining functions visible only within a module

---
class: center, middle

### One liners

---
class: center, middle

Use
```elixir
, do:
```

instead of the

```elixir
do

...

end
```

syntax

---
class: center, middle

*Eg:*

```elixir
def add(x, y), do: x+y
```

---
class: center, middle

### Function Overloading & guard statements

---
class: center, middle

```elixir
def <fn_name> when <guard_clause>
```

---
class: center, middle

### Default Arguments

---
class: center, middle

Default value can be provided using `<arg_name> \\ <arg_value>`

---
class: center, middle

```elixir
def greeting(name, the_greeting \\ "hello") do
  the_greeting <> " " <> name
end
```

---
class: center, middle

*Need not be the last arg to be defaulted*

---
class: center, middle

### Pattern Matching in args

---
class: center, middle

Can be used for destructuring, Eg:

```elixir
def hello(%{name: person_name}), do: IO.puts "Hello, #{person_name}"
```

---
class: center, middle

## Anonymous Functions

---

- Can be created using `fn`
  - Followed by arguments and arrow notation `->`

- Have a closure property

  - Cannot rebind variables in outer scope

---
class: center, middle

```elixir
fn <args> -> <expression> end
```

---
class: center, middle

Called using `.()`

---
class: center, middle

*Eg:*

```elixir
add = fn a, b -> a + b end
add.(1, 2)
```

---
class: center, middle

Can have pattern matching, clauses and guards, similar to `case`

---
class: center, middle

capture functions using `&` prefixed before the `<function_name>/<arity>`

---
class: center, middle

create anonymous functions using `&`

---
class: center, middle

Arguments can be denoted using `&<ordinal>`

---
class: center, middle

## Recursion (instead of Loops)

---
class: center, middle

TCO

---
class: center, middle

## Process - *primer*

---
class: center, middle

Erlang Process vs OS Processes

---

- extremely lightweight in terms of memory and CPU

- Processes are isolated from each other, run concurrent to one another and communicate via message passing.

- Processes are not only the basis for concurrency in Elixir, but they also provide the means for building distributed and fault-tolerant programs.

---
class: center, middle

### Spawning Processes

---
class: center, middle

`spawn` vs `spawn_link`

---

### Sending and receiving messages

- `send`

- `receive do ... end`

- `flush`

---

### Process

- `Process.alive?`

- `self()`

---
class: center, middle

### Maintaining State with Process & Module

---
class: center, middle

`Process.register`

---
class: center, middle

*Eg:*

```elixir
send(:kv, {:get, :hello, self()})
```

---
class: center, middle

Using processes to maintain state and name registration are very common patterns in Elixir applications.

---

Processes are dirt cheap!
Use lots of them! Lots!
Focus on their interactions

.content-credits[http://www2.imm.dtu.dk/courses/02157/DTU-BeamsterThinking.pdf]

---

### Tasks

- `Task.start`

- `Task.start_link`

---
class: center, middle

Return value enables tasks to be used in supervision trees.

---
class: center, middle

`Task.async` + `Task.await`

---
class: center, middle

## IO and File System

---

### IO

- Defaults to `:stdio`, `:stdout`

- Can change to `:stderr`

- `IO.puts`

- `IO.gets`

---

### File

- `File.open/2`

  - By default, files are opened in binary mode

  - `IO.binread`, `IO.binwrite`

---
class: center, middle

`read` vs `read!`

---
class: center, middle

if you don't want to handle the error outcomes, prefer to use the functions ending with an exclamation mark

---

- `mkdir` vs `mkdir_p`

- `rm` vs `rm_rf`

- `cp` vs `cp_r`

---

### Path

- Path.join

- Path.expand

---
class: center, middle

## File is a Process

---
class: center, middle

Using `IO.write` to send a msg to a process.

---
class: center, middle

Given a file is a process, when you write to a file that has been closed, you are actually sending a message to a process which has been terminated.

---
class: center, middle

## Import, alias and require

---

- `alias`

  - Eg: `alias Foo.Bar, as: Bar`

    Alias the module so it can be called as `Bar` instead of `Foo.Bar`

- `require`

  - Eg: `require Foo`

    Require the module in order to use its macros

- `import`

  - Eg: `import Foo`

    Import functions from Foo so they can be called without the `Foo.` prefix

- `use`

  - Eg: `use Foo`

    Invokes the custom code defined in Foo as an extension point

---

### `alias`

- `alias` is lexically scoped

- `alias Math.List` is same as `alias Math.List, as: List`

---

### `require`

- `require` is lexically scoped.

- Eg: `Integer.is_odd(3)`

---

### `import`

- `import` is lexically scoped.

- `:only`

---

### `use`

- `use` macro is frequently used as an extension point

- allows a module to inject any code in the current module

- use requires the given module and then calls the `__using__/1`

---
class: center, middle

> Since `use` allows any code to run, we can't really know the side-effects of using a module without reading its documentation. Therefore use this function with care and only if strictly required.

---
class: center, middle

Don't use use where an `import` or `alias` would do.

---
class: center, middle

It is possible to `alias`, `import`, `require`, or `use` multiple modules at once.

---
class: center, middle

## Module Attributes

---

Module attributes in Elixir serve three purposes:

- They serve to annotate the module, often with information to be used by the user or the VM.

- They work as constants.

- They work as a temporary module storage to be used during compilation.

---

### As annotations

- `@moduledoc` — provides documentation for the current module.

- `@doc` — provides documentation for the function or macro that follows the attribute.

- `@spec` — provides a typespec for the function that follows the attribute.

- `@behaviour` — (notice the British spelling) used for specifying an OTP or user-defined behaviour.

---

### As "constants"

- Trying to access an attribute that was not defined will print a warning

- `accumulate: true`

---

## As temporary storage

- use module attributes as storage to allow developers to create Domain Specific Languages

---
class: center, middle

## Structs

---
class: center, middle

defined using `defstruct` within a module

---
class: center, middle

takes an attribute list

---

- Structs are bare maps underneath
  - `is_map`
  - `.__struct__`

- They don't implement the `Access` behaviour though

- Update attribute values using `|`

---
class: center, middle

You can also skip the default values for attributes, in that case they are initialized as `nil`.

---
class: center, middle

`@enforce_keys` can be used to enforce that certain keys have to be specified when creating the struct

---
class: center, middle

> Enforcing keys provides a simple compile-time guarantee to aid developers when building structs. It is not enforced on updates and it does not provide any sort of value-validation.

---
class: center, middle

## Protocols

---
class: center, middle

A mechanism for dynamic dispatch or polymorphism in Elixir

---

- Use `defprotocol` for defining a protocol with method signatures

- Use `defimpl <protocolname>, for: <type>` for implementing the protocol for specific types

---
class: center, middle

Passing a data type that doesn't implement the protocol raises an error

---

It's possible to implement protocols for all Elixir data types:

- Atom
- BitString
- Float
- Function
- Integer
- List
- Map
- PID
- Port
- Reference
- Tuple

---
class: center, middle

### Protocols & Structs

---
class: center, middle

> The power of Elixir's extensibility comes when protocols and structs are used together.

---
class: center, middle

Instead of sharing protocol implementation with maps, structs require their own protocol implementation.

---
class: center, middle

*Eg:* `MapSet`

---
class: center, middle

### Implementing `Any`

---

Elixir provides two options:

- we can explicitly derive the protocol implementation for our types

- automatically implement the protocol for all types.

---
class: center, middle

In both cases, we need to implement the protocol for `Any`

---

#### Deriving

- Defining a impl for: `Any`

- And then deriving the impl in the othermodule, using: `@derive [<protocolname>]`

---

#### Fallback to `Any`

- Within the protocol set the `@fallback_to_any` to `true`

---
class: center, middle

#### Which one to choose?

---
class: center, middle

> Elixir developers prefer explicit over implicit, you may see many libraries pushing towards the `@derive` approach.

---

### Built-in protocols

- [`Enumerable`](https://hexdocs.pm/elixir/Enumerable.html)
- [`String.Chars`](https://hexdocs.pm/elixir/String.Chars.html)
- [`Inspect`](https://hexdocs.pm/elixir/Inspect.html)
- ...

.content-credits[https://hexdocs.pm/elixir/Protocol.html]

---
class: center, middle

Code
https://github.com/AgarwalConsulting/elixir_training

Slides
https://elixir.slides.agarwalconsulting.com
