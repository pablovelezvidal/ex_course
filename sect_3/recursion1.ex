defmodule ListUtils do
  # factorial function
  def fact(0), do: 1
  def fact(a) do
    a * fact(a - 1)
  end

  # map function iterating and applying the given function to each element
  def map([], _fun), do: []
  def map([head | tail], fun) do
    [ fun.(head) | map(tail, fun) ]
  end

  # finds the max value of a given list using guards but in each function receiving only one paramenter
  def max([current_max, head | tail]) when current_max < head do
    max [head | tail]
  end
  def max([current_max, head | tail]) when current_max >= head do
    max [current_max | tail]
  end
  def max([current_max]), do: current_max

  # alternaitve max value function when we have function with arity of 1 and arity of 2 values
  def alt_max([head | tail]), do: alt_max(tail, head)
  def alt_max([head | tail], current_max) when current_max < head do
    alt_max(tail, head)
  end
  def alt_max([head | tail], current_max) when current_max >= head do
    alt_max(tail, current_max)
  end
  def alt_max([], current_max), do: current_max
end

#ListUtils.map([2,3,4], &(&1 * 3)) |>
ListUtils.alt_max([1, 4, 5, 7, 45, 8, 177, 13, 215, 45, 77]) |>
IO.inspect
