# defmodule Simple do
#   def greeting(name) do
#     "Hello, #{name}"
#   end
# end

defmodule Simple, do: def greeting(name), do: "Hello, #{name}"

i = 5

output = if i > 3, do: "Large value", else: "Small value"

IO.puts output
