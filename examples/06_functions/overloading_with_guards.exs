defmodule Greet do
  def greeting(name) when name == "" do
    "Hello, World!"
  end

  def greeting(name) do
    "Hello, " <> name
  end

  def greeting(name, the_greeting) do
    the_greeting <> " " <> name
  end

  def greeting(name, the_greeting \\ "hello") do
    the_greeting <> " " <> name
  end

end
