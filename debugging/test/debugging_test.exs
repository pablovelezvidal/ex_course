defmodule DebuggingTest do
  use ExUnit.Case
  doctest Debugging

  test "greets the world" do
    assert Debugging.hello() == :world
  end
end
