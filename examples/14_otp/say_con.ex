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

WaitGroup.wait(pids)

IO.puts "Completed all say!"
