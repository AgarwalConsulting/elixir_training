defmodule Example do
  def adder(by) do
    fn x -> by + x end
  end

  # def adder(by) do
  #   &(by + &1)
  # end

  def eval(fun) do
    fun.(32, 10)
  end
end

addBy2 = Example.adder(2)

IO.puts addBy2.(10) # Output: 12
IO.puts addBy2.(12) # Output: ?

# Example.eval &Calculator.add
IO.puts Example.eval fn (x, y) -> x+y end
IO.puts Example.eval &(&1 + &2)

IO.puts Example.eval &Calculator.add/2
IO.puts Example.eval &+/2

to_label = fn
  0, false -> :debug
  1, _ -> :info
  2, _ -> :warning
  _, _ -> :unknown
end

IO.puts to_label.(0, true)
IO.puts to_label.(2, false)
