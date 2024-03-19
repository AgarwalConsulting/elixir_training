defmodule Repeat do
  def repeat(_, 0), do: :ok

  def repeat(name \\ "Toshiba", times \\ 10) when times > 0 do
    IO.puts(name)
    repeat(name, times - 1)
  end
end
