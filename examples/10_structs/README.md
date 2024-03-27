# Structs

- defined using `defstruct` within a module
  - takes an attribute list

- Structs are bare maps underneath
  - `is_map`
  - `.__struct__`

- They don't implement the `Access` behaviour though

- Update attribute values using `|`

- You can also skip the default values for attributes, in that case they are initialized as `nil`.

- `@enforce_keys` can be used to enforce that certain keys have to be specified when creating the struct

> Enforcing keys provides a simple compile-time guarantee to aid developers when building structs. It is not enforced on updates and it does not provide any sort of value-validation.
