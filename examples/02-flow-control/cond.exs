output = cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 != 2 ->
    "But this will"
  true ->
    "Default Arm!"
end

IO.puts output
