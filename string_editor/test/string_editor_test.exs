defmodule StringEditorTest do
  use ExUnit.Case
  doctest StringEditor

  test "greets the world" do
    assert StringEditor.hello() == :world
  end
end
