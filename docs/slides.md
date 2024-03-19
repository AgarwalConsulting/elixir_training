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

#### Truthy and falsy values

Besides the booleans `true` and `false`, Elixir has the concept of a "truthy" or "falsy" value.

- a value is truthy when it is neither `false` nor `nil`
- a value is falsy when it is either `false` or `nil`

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

```elixir
for <var_or_pattern> <- <enumerable>, <condition_statement>, do

end
```

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

#### Map Module

.content-credits[https://hexdocs.pm/elixir/Map.html#functions]

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

## Sigils

---
class: center, middle

Elixir provides double-quoted strings as well as a concept called `charlists`, which are defined using the `~c"hello world"` sigil syntax.

---

### Other Sigils

- Regular Expressions (`~r`)

- Strings (`~s` / `~S`)

- Word Lists (`~w`)

---

### Calendar Sigils

- Date (`~D`)

- Time (`~T`)

- NaiveDateTime (`~N`)

- UTC DateTime (`~U`)

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

## Recursion (instead of Loops)

---
class: center, middle

TCO

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

- Processes are dirt cheap!

- Use lots of them! Lots!

- Focus on their interactions

.content-credits[http://www2.imm.dtu.dk/courses/02157/DTU-BeamsterThinking.pdf]

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

## Typespecs

---
class: center, middle

Elixir is a dynamically typed language, and as such, type specifications are never used by the compiler to optimize or modify code.

---

Still, using type specifications is useful because:

- they provide documentation (for example, tools such as ExDoc show type specifications in the documentation)

- they're used by tools such as Dialyzer, that can analyze code with typespecs to find type inconsistencies and possible bugs

---

Type specifications (most often referred to as typespecs) are defined in different contexts using the following attributes:

- `@type`
- `@opaque`
- `@typep`
- `@spec`
- `@callback`
- `@macrocallback`

---
class: center, middle

```elixir
defmodule StringHelpers do
  @typedoc "A word from the dictionary"
  @type word() :: String.t()

  @spec long_word?(word()) :: boolean()
  def long_word?(word) when is_binary(word) do
    String.length(word) > 8
  end
end
```

---

- We declare a new type (`word()`) that is equivalent to the string type (`String.t()`).

- We describe the type using a `@typedoc`, which will be included in the generated documentation.

- We specify that the `long_word?/1` function takes an argument of type `word()` and returns a boolean (`boolean()`), that is, either `true` or `false`.

---
class: center, middle

### [Types and their syntax](https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax)

---

#### Remote Types

Any module is also able to define its own types and the modules in Elixir are no exception. For example, the Range module defines a `t/0` type that represents a range: this type can be referred to as `Range.t/0`. In a similar fashion, a string is `String.t/0`, and so on.

---
class: center, middle

### Behaviours

---
class: center, middle

Behaviours in Elixir (and Erlang) are a way to separate and abstract the generic part of a component (which becomes the behaviour module) from the specific part (which becomes the callback module).

---
class: center, middle

#### Parser Example

---

Defining a callback is a matter of defining a specification for that callback, made of:

- the callback name (`parse` or `extensions` in the example)

- the arguments that the callback must accept (`String.t`)

- the expected type of the callback return value

---
class: center, middle

#### Using Behaviour

---
class: center, middle

Behaviours are useful because you can pass modules around as arguments and you can then call back to any of the functions specified in the behaviour.

---
class: center, middle

#### Optional Callbacks

Optional callbacks can be defined through the `@optional_callbacks` module attribute, which has to be a keyword list with `function` or `macro` name as key and `arity` as value.

---
class: center, middle

## Errors/Exceptions

---
class: center, middle

Elixir has three error mechanisms: `errors`, `throws`, and `exits`.

---
class: center, middle

### Errors

---
class: center, middle

Errors (or exceptions) are used when exceptional things happen in the code.

---
class: center, middle

```elixir
:foo + 1

raise "oops"

raise ArgumentError, message: "invalid argument foo"
```

---
class: center, middle

You can also define your own errors by creating a module and using the `defexception/1` construct inside it.

---
class: center, middle

*Eg:*

```elixir
defmodule MyError do
  defexception message: "default message"
end

raise MyError

raise MyError, message: "custom message"
```

---
class: center, middle

Errors can be rescued using the `try/rescue` construct:

```elixir
try do
  raise "oops"
rescue
  e in RuntimeError -> e
end
```

---
class: center, middle

In practice, Elixir developers rarely use the try/rescue construct.

---
class: center, middle

#### Fail fast / Let it crash

---
class: center, middle

One saying that is common in the Erlang community, as well as Elixir's, is "fail fast" / "let it crash".

---
class: center, middle

The idea behind let it crash is that, in case something **unexpected** happens, it is best to let the exception happen, without rescuing it.

---
class: center, middle

It is important to emphasize the word **unexpected**.

---
class: center, middle

`File.read` vs `File.read!`

---
class: center, middle

If you don't want to handle the error outcomes, prefer to use the functions ending with an exclamation mark.

---
class: center, middle

#### Reraise

---
class: center, middle

One situation where we may want to use `try/rescue` is for observability/monitoring.

---
class: center, middle

```elixir
try do
  ... some code ...
rescue
  e ->
    Logger.error(Exception.format(:error, e, __STACKTRACE__))
    reraise e, __STACKTRACE__
end
```

---
class: center, middle

We use the `__STACKTRACE__` construct both when formatting the exception and when re-raising.

---
class: center, middle

This ensures we reraise the exception as is, without changing value or its origin.

---
class: center, middle

Generally speaking, we take errors in Elixir literally: they are reserved for unexpected and/or exceptional situations, never for controlling the flow of our code.

---
class: center, middle

In case you actually need flow control constructs, `throws` should be used.

---
class: center, middle

### Throws

---
class: center, middle

In Elixir, a value can be thrown and later be caught.

---
class: center, middle

`throw` and `catch` are reserved for situations where it is not possible to retrieve a value unless by using `throw` and `catch`.

---
class: center, middle

```elixir
try do
  Enum.each(-50..50, fn x ->
    if rem(x, 13) == 0, do: throw(x)
  end)
  "Got nothing"
catch
  x -> "Got #{x}"
end
```

---
class: center, middle

[Enum.find/2](https://hexdocs.pm/elixir/Enum.html#find/2) is better.

---
class: center, middle

### Exits

---
class: center, middle

All Elixir code runs inside processes that communicate with each other.

---
class: center, middle

When a process dies of "natural causes" (e.g., unhandled exceptions), it sends an exit signal.

---
class: center, middle

A process can also die by explicitly sending an exit signal:

```elixir
spawn_link(fn -> exit(1) end)
```

---
class: center, middle

`exit` can also be "caught" using `try/catch`

---
class: center, middle

```elixir
try do
  exit("I am exiting")
catch
  :exit, _ -> "not really"
end
```

---
class: center, middle

Using try/catch is already uncommon and using it to catch exits is even rarer.

---
class: center, middle

`exit` signals are an important part of the fault tolerant system provided by the Erlang VM.

---
class: center, middle

Processes usually run under supervision trees which are themselves processes that listen to `exit` signals from the supervised processes. Once an `exit` signal is received, the supervision strategy kicks in and the supervised process is restarted.

---
class: center, middle

It is exactly this supervision system that makes constructs like `try/catch` and `try/rescue` so uncommon in Elixir. Instead of rescuing an error, we'd rather "fail fast" since the supervision tree will guarantee our application will go back to a known initial state after the error.

---
class: center, middle

### After

---
class: center, middle

Sometimes it's necessary to ensure that a resource is cleaned up after some action that could potentially raise an error.

---
class: center, middle

`try/after` construct allows you to do that.

---
class: center, middle

*Eg:*

```elixir
{:ok, file} = File.open("sample", [:utf8, :write])
try do
  IO.write(file, "olá")
  raise "oops, something went wrong"
after
  File.close(file)
end
```

---
class: center, middle

The after clause will be executed regardless of whether or not the tried block succeeds.

---
class: center, middle

If a linked process exits, this process will exit and the `after` clause will not get run.

---
class: center, middle

Files in Elixir are also linked to the current processes and therefore they will always get closed if the current process crashes, independent of the `after` clause.

---
class: center, middle

Sometimes you may want to wrap the entire body of a function in a try construct, often to guarantee some code will be executed afterwards.

---
class: center, middle

Elixir allows you to omit the `try` line:

```elixir
defmodule RunAfter do
  def without_even_trying do
    raise "oops"
  after
    IO.puts "cleaning up!"
  end
end
RunAfter.without_even_trying
```

---
class: center, middle

Elixir will automatically wrap the function body in a try whenever one of `after`, `rescue` or `catch` is specified.

---
class: center, middle

### Else

---
class: center, middle

If an `else` block is present, it will match on the results of the `try` block whenever the `try` block finishes without a throw or an error.

---
class: center, middle

*Eg:*

```elixir
x = 2
2
try do
  1 / x
rescue
  ArithmeticError ->
    :infinity
else
  y when y < 1 and y > -1 ->
    :small
  _ ->
    :large
end
```

---
class: center, middle

Exceptions in the `else` block are not caught. If no pattern inside the `else` block matches, an exception will be raised; this exception is not caught by the current `try/catch/rescue/after` block.

---
class: center, middle

Code
https://github.com/AgarwalConsulting/elixir_training

Slides
https://elixir.slides.agarwalconsulting.com
