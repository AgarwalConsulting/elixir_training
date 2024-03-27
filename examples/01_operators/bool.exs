# `or/2`, `and/2`, and `not/1` they expect something that evaluates to a boolean (true or false) as their first argument

false and raise("This error will never be raised")

# to indicate the absence of a value, and a set of logical operators that also manipulate `nil`: ||/2, &&/2, and !/1

1 || true
nil && 13
