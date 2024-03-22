defmodule Say do
  def say(id) do
    IO.puts "Started say #{id}..."
    i = Enum.random(300..400)

    busy_work(i)

    IO.puts "Hello from say #{id}, #{i}"
  end

  defp busy_work(n) do # n = 100; n ^ 2
    Enum.each(1..n, fn (i) ->
      Enum.each(1..n, fn(j) ->
        res = i * j # CPU intensive
        File.write("/dev/null", to_string(res)) # IO intensive
      end)
    end)
  end
end

pids = for id <- 1..2 do
  IO.puts "Starting say #{id}..."
  spawn fn -> Say.say(id) end
end

defmodule WaitGroup do
  def monitor(pids) do
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

WaitGroup.monitor(pids)

IO.puts "Completed all say!"
