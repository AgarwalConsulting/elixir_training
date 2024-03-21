defmodule Animal do
  # sound
  # eat

  @callback sound(any()) :: String.t()

  defmacro __using__(_opts) do
    # some real-life ExUnit code omitted here
    quote do
      @behaviour Animal
    end
  end
end


defmodule Lion do
  use Animal

  defstruct [:age]

  @impl Animal
  def sound(l) do
    # "roars"
    "*roars* the #{l.age} year old"
  end
end

# Animal.move(l) - Protocol

# Behaviour

# Cat.move(l)
