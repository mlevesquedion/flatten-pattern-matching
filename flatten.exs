defmodule Flatten do
  def flatten([[head] | tail]) do
    flatten([head | tail])
  end

  def flatten([head | tail]) do
    [head | flatten(tail)]
  end

  def flatten([]) do
    []
  end
end

ExUnit.start()

defmodule FlattenTest do
  use ExUnit.Case
  import Flatten

  test "does nothing to []" do
    assert flatten([]) == []
  end

  test "does nothing to an already flat list" do
    assert flatten([1, 2, 3]) == [1, 2, 3]
  end

  test "flattens a deeply-nested singleton list" do
    assert flatten([[[[[[[[1]]]]]]]]) == [1]
  end

  test "flattens a list with elements of varying depths" do
    assert flatten([1, [2], [[3]], [[[4]]]]) == [1, 2, 3, 4]
  end
end
