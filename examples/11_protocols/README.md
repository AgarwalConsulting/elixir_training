# Protocols

- A mechanism for dynamic dispatch or polymorphism in Elixir

- Use `defprotocol` for defining a protocol with method signatures

- Use `defimpl <protocolname>, for: <type>` for implementing the protocol for specific types

- Passing a data type that doesn't implement the protocol raises an error

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

## Protocols & Structs

> The power of Elixir's extensibility comes when protocols and structs are used together.

- Instead of sharing protocol implementation with maps, structs require their own protocol implementation.
  - Eg: `MapSet`

## Implementing `Any`

- Elixir provides two options:
  - we can explicitly derive the protocol implementation for our types
  - automatically implement the protocol for all types.

- In both cases, we need to implement the protocol for `Any`.

### Deriving

Requires:

- Defining a impl for: `Any`

- And then deriving the impl in the othermodule, using: `@derive [<protocolname>]`

### Fallback to `Any`

- Within the protocol set the `@fallback_to_any` to `true`

### Which one to choose?

> Elixir developers prefer explicit over implicit, you may see many libraries pushing towards the `@derive` approach.

## Built-in protocols

- `Enumerable`
- `String.Chars`
- `Inspect`

More info: [Protocol](https://hexdocs.pm/elixir/Protocol.html)
