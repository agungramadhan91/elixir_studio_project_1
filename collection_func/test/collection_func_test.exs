defmodule CollectionFuncTest do
  use ExUnit.Case
  doctest CollectionFunc

  test "greets the world" do
    assert CollectionFunc.hello() == :world
  end
end
