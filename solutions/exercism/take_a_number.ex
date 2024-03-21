defmodule TakeANumber do
  def start() do
    {:ok, pid} = Task.start_link(fn -> loop(0) end)
    pid
  end

  defp loop(state) do
    receive do
      {:report_state, caller} ->
        send(caller, state)
        loop(state)
      {:take_a_number, caller} ->
        state = state + 1
        send(caller, state)
        loop(state)
      :stop ->
        :ok
      _ ->
        loop(state)
    end
  end
end
