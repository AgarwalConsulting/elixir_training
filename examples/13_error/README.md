# Errors & Exceptions

---

Elixir has three error mechanisms: `errors`, `throws`, and `exits`.

---

## Errors

---

Errors (or exceptions) are used when exceptional things happen in the code.

---

```elixir
:foo + 1

raise "oops"

raise ArgumentError, message: "invalid argument foo"
```

---

You can also define your own errors by creating a module and using the `defexception/1` construct inside it.

---

*Eg:*

```elixir
defmodule MyError do
  defexception message: "default message"
end

raise MyError

raise MyError, message: "custom message"
```

---

Errors can be rescued using the `try/rescue` construct:

```elixir
try do
  raise "oops"
rescue
  e in RuntimeError -> e
end
```

---

In practice, Elixir developers rarely use the try/rescue construct.

---

### Fail fast / Let it crash

---

One saying that is common in the Erlang community, as well as Elixir's, is "fail fast" / "let it crash".

---

The idea behind let it crash is that, in case something **unexpected** happens, it is best to let the exception happen, without rescuing it.

---

It is important to emphasize the word **unexpected**.

---

class: center, middle

`File.read` vs `File.read!`

---
class: center, middle

If you don't want to handle the error outcomes, prefer to use the functions ending with an exclamation mark.

---

### Reraise

---

One situation where we may want to use `try/rescue` is for observability/monitoring.

---

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

We use the `__STACKTRACE__` construct both when formatting the exception and when re-raising.

---

This ensures we reraise the exception as is, without changing value or its origin.

---

Generally speaking, we take errors in Elixir literally: they are reserved for unexpected and/or exceptional situations, never for controlling the flow of our code.

---

In case you actually need flow control constructs, throws should be used.

---

## Throws

---

In Elixir, a value can be thrown and later be caught.

---

`throw` and `catch` are reserved for situations where it is not possible to retrieve a value unless by using `throw` and `catch`.

---

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

[Enum.find/2](https://hexdocs.pm/elixir/Enum.html#find/2) is better.

---

## Exits

---

All Elixir code runs inside processes that communicate with each other.

---

When a process dies of "natural causes" (e.g., unhandled exceptions), it sends an exit signal.

---

A process can also die by explicitly sending an exit signal:

```elixir
spawn_link(fn -> exit(1) end)
```

---

`exit` can also be "caught" using `try/catch`

---

```elixir
try do
  exit("I am exiting")
catch
  :exit, _ -> "not really"
end
```

---

Using try/catch is already uncommon and using it to catch exits is even rarer.

---

`exit` signals are an important part of the fault tolerant system provided by the Erlang VM.

---

Processes usually run under supervision trees which are themselves processes that listen to `exit` signals from the supervised processes. Once an `exit` signal is received, the supervision strategy kicks in and the supervised process is restarted.

---

It is exactly this supervision system that makes constructs like `try/catch` and `try/rescue` so uncommon in Elixir. Instead of rescuing an error, we'd rather "fail fast" since the supervision tree will guarantee our application will go back to a known initial state after the error.

---

## After

---

Sometimes it's necessary to ensure that a resource is cleaned up after some action that could potentially raise an error.

---

`try/after` construct allows you to do that.

---

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

The after clause will be executed regardless of whether or not the tried block succeeds.

---

If a linked process exits, this process will exit and the `after` clause will not get run.

---

Files in Elixir are also linked to the current processes and therefore they will always get closed if the current process crashes, independent of the `after` clause.

---

Sometimes you may want to wrap the entire body of a function in a try construct, often to guarantee some code will be executed afterwards.

---

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

Elixir will automatically wrap the function body in a try whenever one of `after`, `rescue` or `catch` is specified.

---

## Else

---

If an `else` block is present, it will match on the results of the `try` block whenever the `try` block finishes without a throw or an error.

---

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

Exceptions in the `else` block are not caught. If no pattern inside the `else` block matches, an exception will be raised; this exception is not caught by the current `try/catch/rescue/after` block.

---
