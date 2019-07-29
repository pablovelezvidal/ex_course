defmodule GameOfStones.GameClient do
  def main(argv) do
    parse(argv) |> play
  end

  defp parse(arguments) do
    {opts, _, _} = OptionParser.parse(arguments, switches: [stones: :integer])
    opts |> Keyword.get(:stones, Application.get_env(:game_of_stones, :default_stones))
  end

  def play(initial_stones_num \\ 20) do
    case GameOfStones.GameServer.set_stones(initial_stones_num) do
      {player, current_stones, :game_in_progress} ->
        IO.puts "Welcome! It's player #{player} turn. #{current_stones} in the pile" |>
        Colors.green
      {player, current_stones, :game_continue} ->
        IO.puts "Continuing the Game! it's player #{player} turn!, the number of stones is #{current_stones} in the pile"
    end
    take()
  end

  defp take() do
    case GameOfStones.GameServer.take(ask_stones()) do
      {:next_turn, next_player, stones_count} ->
        IO.puts "\nPlayer #{next_player} turns next. Stones: #{stones_count}"
        take()
      {:winner, winner} ->
        IO.puts "\nPlayer #{winner} wins!!!"
      {:error, reason} ->
        IO.puts "\nThere was an error: #{reason}"
        take()
    end
  end

  defp ask_stones do
    IO.gets("\n Please take 1 to 3 stones: \n ") |>
    String.trim |>
    Integer.parse |>
    stones_to_take()
  end

  defp stones_to_take({count, _}), do: count
  defp stones_to_take(:error), do: nil
end
