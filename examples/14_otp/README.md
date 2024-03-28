# Mix & OTP

## Mix

---

Mix is a build tool that ships with Elixir that provides tasks for creating, compiling, testing your application, managing its dependencies and much more;

---

```bash
mix new <app_name>
```

---

```
elixir/app/hello $ tree
.
├── README.md
├── lib
│   └── hello.ex
├── mix.exs
└── test
    ├── hello_test.exs
    └── test_helper.exs

3 directories, 5 files
```

---

The `mix.exs` file

---

- Configures the project using `def project`

- `def application`, which is used to generate an application file.

- a private function named `deps`, which is invoked from the project function, that defines our project dependencies

---

This structure is enough to compile our project:

```bash
mix compile
```

---

Once the project is compiled, you can start a iex session inside the project.

```bash
iex -S mix
```

---

The `-S mix` is necessary to load the project in the interactive shell

---

While you may start a new session whenever there are changes to the project source code, you can also recompile the project from within iex with the recompile helper, like this:

```elixir
recompile()
```

---

### Other Features

- Auto code formatting via `.formatter.exs` using `mix format`.

- Environment management. By default, Mix understands three environments:

  `:dev` — the one in which Mix tasks (like compile) run by default
  `:test` — used by mix test
  `:prod` — the one you will use to run your project in production

- ...

---

```elixir
def project do
  [
    ...,
    start_permanent: Mix.env() == :prod,
    ...
  ]
end
```

---

When true, the :start_permanent option starts your application in permanent mode, which means the Erlang VM will crash if your application's supervision tree shuts down.

---

```bash
MIX_ENV=prod mix compile
```

---

## OTP

- `GenServer`s abstract the `receive do loop`
  - it is a behavior

- Use Supervisor for keep GenServer processes up and running
  - `mix new <app_name> -sup`

- Monitor a process using: `Process.monitor`
