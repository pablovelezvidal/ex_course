defmodule Streams do
  def transform do
    # After each transformation with Enum, a new list is returned. With streams, just a stream is returned so is more optimal
    # This is called Stream composition. Streams are lazy, so in case of use take, they will just apply to the elements required
    # or whe using this rang 1..1_000_000 |> Stream.map(&(&1 * 2)) |> Enum.take(3) stream will only map over three elements.
    [1, 2, 3, 4, 5, 6] |> Stream.map(&(&1 * 2)) |> Stream.drop_every(3) |> Enum.take(3) |> Enum.reduce(0, &(&1 + &2))
  end

  def own_stream(multiplier) do
    Stream.iterate(1, &(&1 * multiplier))
    # multiplier = 2
    # 1 * 2 = 2
    # 2 * 2 = 4
  end
end


Streams.own_stream(3) |> Enum.take(15) |> IO.inspect
