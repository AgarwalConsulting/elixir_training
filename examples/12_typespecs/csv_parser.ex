defmodule CSVParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some csv " <> str} # ... parse CSV

  @impl Parser
  def extensions, do: [".csv"]
end
