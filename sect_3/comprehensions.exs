defmodule Comp do
  require Integer

  def demo(list) do
    for el when el < 10 <- list, Integer.is_even(el), do: el * 2 # el <- list is the generator
    # list |> Enum.map(&(&1 * 2))
    # list |> Stream.filter(Integer.is_even/1) |> Enum.map(&(&1 * 2)) is more efficient because the use of streams
  end

  def demo2(list1, list2) do
    for el1 <- list1, el2 <- list2, Integer.is_even(el1), Integer.is_odd(el2), do: {el1, el2}
  end

  def decipher(ciphered_str) do
    for <<char <- ciphered_str>>, do: char - 1 #caeser cipher
  end

  def format_data(data) do
    for {name, age} <- data, into: Map.new, do: {format_name(name), age}
  end

  defp format_name(name) do
    name |> String.downcase |> String.to_atom
  end

end

data = %{"Joe" => 50, "Bill" => 25, "Alice" => 23}

# Comp.demo(1..16) |> IO.inspect
# Comp.decipher("fmjyjs") |> IO.inspect
# Comp.demo2(1..5, 1..8) |> IO.inspect
Comp.format_data(data) |> IO.inspect

