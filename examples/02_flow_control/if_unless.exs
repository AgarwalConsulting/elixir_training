i = 5

output = if i > 3 do
  IO.puts "Large value"
else
  IO.puts "Small value"
end

IO.puts output

output = unless i > 3 do
  IO.puts "Small value"
else
  IO.puts "Large value"
end

IO.puts output
