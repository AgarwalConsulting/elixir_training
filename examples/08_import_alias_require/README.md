# Import, alias and require

- `alias`

  - Eg: `alias Foo.Bar, as: Bar` - Alias the module so it can be called as `Bar` instead of `Foo.Bar`

- `require`

  - Eg: `require Foo` - Require the module in order to use its macros

- `import`

  - Eg: `import Foo` - Import functions from Foo so they can be called without the `Foo.` prefix

- `use`

  - Eg: `use Foo` - Invokes the custom code defined in Foo as an extension point

## `alias`

- `alias` is lexically scoped

- `alias Math.List` is same as `alias Math.List, as: List`

## `require`

- `require` is lexically scoped.

- Eg: `Integer.is_odd(3)`

## `import`

- `import` is lexically scoped.

- `:only`

## `use`

- `use` macro is frequently used as an extension point

- allows a module to inject any code in the current module

- use requires the given module and then calls the `__using__/1`

---

> Since `use` allows any code to run, we can't really know the side-effects of using a module without reading its documentation. Therefore use this function with care and only if strictly required. Don't use use where an `import` or `alias` would do.

---

It is possible to `alias`, `import`, `require`, or `use` multiple modules at once.
