defmodule User do
  defstruct name: "Gaurav", age: 32
end

u = %User{}

IO.puts u.name
IO.puts u.age

ga = %{u | name: "G A"}

IO.inspect ga
