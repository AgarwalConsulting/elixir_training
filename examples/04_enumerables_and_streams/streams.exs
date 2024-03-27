infinite_list = Stream.cycle(1..10)

# infinite_list
#   |> Enum.map(&(&1 * 2))
#   |> Enum.take 100
#   |> Enum.sum
#   |> IO.puts

infinite_list
  |> Stream.map(&(&1 * 2))
  |> Enum.take(100)
  |> Enum.sum
  |> IO.puts
