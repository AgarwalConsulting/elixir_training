# Typespecs

Elixir comes with a notation for declaring types and specifications. This document is a reference into their uses and syntax.

---

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

## [Types and their syntax](https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax)

---

## Basic Types

```elixir
type ::
      any()                     # the top type, the set of all terms
      | none()                  # the bottom type, contains no terms
      | atom()
      | map()                   # any map
      | pid()                   # process identifier
      | port()                  # port identifier
      | reference()
      | tuple()                 # tuple of any size

                                ## Numbers
      | float()
      | integer()
      | neg_integer()           # ..., -3, -2, -1
      | non_neg_integer()       # 0, 1, 2, 3, ...
      | pos_integer()           # 1, 2, 3, ...

                                                                      ## Lists
      | list(type)                                                    # proper list ([]-terminated)
      | nonempty_list(type)                                           # non-empty proper list
      | maybe_improper_list(content_type, termination_type)           # proper or improper list
      | nonempty_improper_list(content_type, termination_type)        # improper list
      | nonempty_maybe_improper_list(content_type, termination_type)  # non-empty proper or improper list

      | Literals                # Described in section "Literals"
      | BuiltIn                 # Described in section "Built-in types"
      | Remotes                 # Described in section "Remote types"
      | UserDefined             # Described in section "User-defined types"
```

---

## Literals

```elixir
type ::                               ## Atoms
      :atom                           # atoms: :foo, :bar, ...
      | true | false | nil            # special atom literals

                                      ## Bitstrings
      | <<>>                          # empty bitstring
      | <<_::size>>                   # size is 0 or a positive integer
      | <<_::_*unit>>                 # unit is an integer from 1 to 256
      | <<_::size, _::_*unit>>

                                      ## (Anonymous) Functions
      | (-> type)                     # zero-arity, returns type
      | (type1, type2 -> type)        # two-arity, returns type
      | (... -> type)                 # any arity, returns type

                                      ## Integers
      | 1                             # integer
      | 1..10                         # integer from 1 to 10

                                      ## Lists
      | [type]                        # list with any number of type elements
      | []                            # empty list
      | [...]                         # shorthand for nonempty_list(any())
      | [type, ...]                   # shorthand for nonempty_list(type)
      | [key: value_type]             # keyword list with optional key :key of value_type

                                              ## Maps
      | %{}                                   # empty map
      | %{key: value_type}                    # map with required key :key of value_type
      | %{key_type => value_type}             # map with required pairs of key_type and value_type
      | %{required(key_type) => value_type}   # map with required pairs of key_type and value_type
      | %{optional(key_type) => value_type}   # map with optional pairs of key_type and value_type
      | %SomeStruct{}                         # struct with all fields of any type
      | %SomeStruct{key: value_type}          # struct with required key :key of value_type

                                      ## Tuples
      | {}                            # empty tuple
      | {:ok, type}                   # two-element tuple with an atom and any type
```

---

### Remote Types

Any module is also able to define its own types and the modules in Elixir are no exception. For example, the Range module defines a `t/0` type that represents a range: this type can be referred to as `Range.t/0`. In a similar fashion, a string is `String.t/0`, and so on.

---

## Behaviours

---

Behaviours in Elixir (and Erlang) are a way to separate and abstract the generic part of a component (which becomes the behaviour module) from the specific part (which becomes the callback module).

---

### Parser Example

---

Defining a callback is a matter of defining a specification for that callback, made of:

- the callback name (`parse` or `extensions` in the example)

- the arguments that the callback must accept (`String.t`)

- the expected type of the callback return value

---

### Using behaviours

---

Behaviours are useful because you can pass modules around as arguments and you can then call back to any of the functions specified in the behaviour.

---

For example, we can have a function that receives a filename, several parsers, and parses the file based on its extension.

---

## Optional Callbacks

Optional callbacks can be defined through the `@optional_callbacks` module attribute, which has to be a keyword list with function or macro name as key and arity as value.

---
