defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t) :: {:ok, term} | {:error, atom}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t]
end
