# list = [1, 2, 3, 5, 7]
# [first_val | _] = list
# [_, second_val, _] = list
# [_, second_val | _] = list

# x = 'hello' # char list
# x = 'greeting' # char list
# x = 'something not matching' # char list
x = ''
h = 104
g = 103

output = case x do
  [first_char | _ ] when first_char in [104, 103] ->
    "The first character is #{[first_char]}!"
  _ when length(x) > 1 -> ## Match all
    "Unknown character!"
  _ ->
    "Empty char list!"
end

IO.puts output
