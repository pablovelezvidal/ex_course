defmodule ListUtils do
  # when the last thing a function do is calling itself or calling another function it is a tail call function
  def mult(list), do: do_mult(1, list)

  defp do_mult(current_value, []), do: current_value

  defp do_mult(current_value, [head | tail]) do
    do_mult(current_value * head, tail)
  end

  # alternative version with just one paremeter
  def alt_mult(list), do: do_alt_mult([1 | list])

  defp do_alt_mult([ current_value | [] ]), do: current_value

  defp do_alt_mult([current_value, next | tail]) do
    do_alt_mult([current_value * next | tail])
  end

  # factorial with tail call
  def fact(a), do: do_fact(1, a)

  defp do_fact(result, 0), do: result

  defp do_fact(result, a) do
    do_fact(result * a, a - 1)
  end

end

my_list = 500#[1, 2, 3, 4]

my_list |>
  ListUtils.fact |>
  IO.inspect
