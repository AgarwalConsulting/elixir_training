defmodule Fibonacci do
  def fib(n \\ 0, i \\ 1, j \\ 0, acc \\ [])

  def fib(0, _, _, acc) do
    acc
  end

  def fib(n, i, j, acc) when n > 0 do
    fib(n - 1, j, i+j, [j | acc])
  end
end
