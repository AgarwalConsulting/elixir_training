defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when (secret_number - 1 == guess) or (secret_number + 1 == guess), do: "So close"
  def compare(secret_number, guess) when (guess > secret_number), do: "Too high"
  def compare(secret_number, guess) when (guess < secret_number), do: "Too low"
end

# Modify the `compare` function to respond to a lack of guess.

# ```elixir
# GuessingGame.compare(5)
# # => "Make a guess"

# GuessingGame.compare(5, :no_guess)
# # => "Make a guess"
# ```
