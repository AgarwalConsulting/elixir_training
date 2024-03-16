defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

## Deriving for any type
defimpl Size, for: Any do
  def size(_), do: 0
end

defmodule OtherUser do
  @derive [Size]
  defstruct [:name, :age]
end
