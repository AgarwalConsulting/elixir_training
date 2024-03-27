# Module Attributes

Module attributes in Elixir serve three purposes:

- They serve to annotate the module, often with information to be used by the user or the VM.
- They work as constants.
- They work as a temporary module storage to be used during compilation.

## As annotations

- `@moduledoc` — provides documentation for the current module.

- `@doc` — provides documentation for the function or macro that follows the attribute.

- `@spec` — provides a typespec for the function that follows the attribute.

- `@behaviour` — (notice the British spelling) used for specifying an OTP or user-defined behaviour.

## As "constants"

- Trying to access an attribute that was not defined will print a warning

- `accumulate: true`

## As temporary storage

- use module attributes as storage to allow developers to create Domain Specific Languages
