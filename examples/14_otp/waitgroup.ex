defmodule WaitGroup do
  def wait(pids) do
    Enum.each(pids, &Process.monitor/1)
    wait(pids, length(pids))
  end

  defp wait(_, 0), do: :ok

  defp wait(pids, count) do
    receive do
      {:DOWN, _, _, pid, _} ->
        if Enum.member?(pids, pid) do
          wait(pids, count - 1)
        else
          wait(pids, count)
        end
    end
  end
end
