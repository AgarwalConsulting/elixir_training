defmodule KvsTest do
  use ExUnit.Case
  doctest Kvs

  test "greets the world" do
    assert Kvs.hello() == :world
  end
end
