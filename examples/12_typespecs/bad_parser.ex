defmodule BADParser do
  @behaviour Parser

  @impl Parser
  def parse, do: {:ok, "something bad"}

  @impl Parser
  def extensions, do: ["bad"]
end
