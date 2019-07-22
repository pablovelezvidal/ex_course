defmodule Demo do
  # if - else conditionals
  def run do
    val = 4
    #if val == 4, do: "positive", else: "negative"
    #if val == 4 do
    unless val == 5 do
      "the value is not five"
    else
      "the value is five"
    end
  end

  # cond - do statement
  def run2(str) do
    len = String.length(str)
    cond do
      len > 0 && len < 5 -> "short"
      len >= 5 && len < 10 -> "medium"
      len > 10 -> "big"
      true -> "an empty string" #fallback
    end
  end

  # case - expression - do statement
  def run3(argv) do
    parsed_args = OptionParser.parse(argv, switches: [debug: :boolean])
    case Keyword.fetch(elem(parsed_args, 0), :debug) do
      {:ok, true} -> "debug!"
      {:ok, false} -> "no debug!"
      _ -> "debug option is not set!" # fallback clause
    end
  end
end

#Demo.run |> IO.inspect
#Demo.run2("mystr") |> IO.inspect
Demo.run3(System.argv) |> IO.inspect
