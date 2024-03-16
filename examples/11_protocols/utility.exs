# defmodule Utility do
#   def type(value) when is_binary(value), do: "string"
#   def type(value) when is_integer(value), do: "integer"
#   # ... other implementations ...
# end

defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end
