defmodule Foo do
  Module.register_attribute(__MODULE__, :param, accumulate: true)

  @param :foo
  @param :bar
  # here @param == [:bar, :foo]
end
