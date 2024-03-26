defmodule My do
  defmacro unless(bool_expr, eval) do
    IO.inspect bool_expr
    IO.inspect eval
    quote do
      if !unquote(bool_expr), unquote(eval)
    end
  end
end

require My
My.unless(false, [{:do, IO.puts "hello"}])
