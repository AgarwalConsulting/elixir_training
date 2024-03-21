x = Enum.random(0..3)
y = Enum.random(-1..1)

IO.puts "Input: #{x} #{y}"

try do
  1 / x
rescue
  ArithmeticError ->
    IO.puts :infinity
else
  y when y < 1 and y > -1 ->
    IO.puts :small
  _ ->
    IO.puts :large
end

# ---

# defmodule Sample do
#   def sample do
#     IO.puts "Using resource..."

#     raise "oops"

#     42
#   after
#     IO.puts "Cleaning up resource..."
#   rescue
#     e -> IO.puts "Rescuing: #{inspect(e)}"
#   end
# end

# ---

# i = Enum.random 1..100

# IO.puts("Input: #{i}")

# try do
#   if rem(i, 2) != 0 do
#     throw i
#   end

#   i * 2
# catch
#   x -> IO.puts "Caught: #{x}"
# end

# ---

# defmodule VelocityError do
#   defexception [:message]
# end

# ---

# try do
#   1 * "hello"
#   raise
# rescue
#   e in RuntimeError -> IO.puts "Rescuing from: #{inspect(e)}"
#   e in ArithmeticError ->
#     IO.puts "Rescuing from Arithmetic Error"
#     # Logging the error / alert the team
#     reraise e, __STACKTRACE__

# end
# raise VelocityError, message: "is not a number"
# raise VelocityError, message: "is missing"
