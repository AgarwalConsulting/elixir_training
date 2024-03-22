defmodule TH do
  def datatype(var) do
    var |> IEx.Info.info |> hd |> elem(1)
  end

  def get_all_process_info do
    Enum.each(Process.list, &({&1, Process.info(&1)} |> IO.inspect))
  end
end
