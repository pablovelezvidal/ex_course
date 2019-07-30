defmodule Demo do
  defmacro work(time) do
    another_var = "valur from test outside macro"
    #quote bind_quoted: [time: time]  do # with quote bind creates like a snapshot, so the value of time is the same both times no matter the sleep
    quoted_code = quote do

      another_var = "valur from test! inside macro"

      unquote(time) # without the binding executes once everytime
      #time
      |> IO.inspect
      :timer.sleep(2000)
      unquote(time)
      #time
      |> IO.inspect

      IO.inspect another_var
    end

    #quoted_code |> Macro.to_string |> IO.inspect

    IO.inspect another_var

    quoted_code
  end
end

defmodule Playground do
  require Demo

  def test! do
    another_var = "valur from test!"
    :os.system_time |> Demo.work
    IO.inspect another_var
  end

end

Playground.test!
