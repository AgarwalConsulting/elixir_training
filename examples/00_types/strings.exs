str = "hello"
# str = "hello 😀"
# str = "नमस्ते" # Na-Ma-S-Te (Grapheme Clustering)

IO.puts byte_size(str)
IO.puts String.length(str)

# String.codepoints(str)
# String.graphemes(str)

IO.inspect(str, binaries: :as_binaries)
