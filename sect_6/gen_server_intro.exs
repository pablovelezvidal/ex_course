defmodule Demo do
  use GenServer

  def start(initial_state) do
    GenServer.start(__MODULE__, initial_state)
  end

  # callback run when the server is started
  def init(initial_state) when is_number(initial_state) do
    " I am started with the state #{initial_state}" |> IO.puts
    { :ok, initial_state }
  end

  def init(_) do
    {:stop, "The initial state is not a number :("}
  end
end

{:ok, _} = Demo.start(7) |> IO.inspect
