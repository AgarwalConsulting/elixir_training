defmodule TH do
  def datatype(var) do
    var |> IEx.Info.info |> hd |> elem(1)
  end
end
