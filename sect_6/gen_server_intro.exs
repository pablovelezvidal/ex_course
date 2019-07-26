defmodule Demo do
  use GenServer

  # Interface function
  def start(initial_state) do
    GenServer.start(__MODULE__, initial_state, name: __MODULE__) # By giving a name to the process, we use it to call the server instead of passing the pid
  end

  def sqrt do # like here, we dont use the pid, instead we use the MODULE
    GenServer.cast(__MODULE__, :sqrt)
  end

  def add(number) do
    GenServer.cast(__MODULE__, {:add, number})
  end

  def result do
    # Timeout is five seconds
    GenServer.call __MODULE__, :result
  end

  # callback run when the server is started
  def init(initial_state) when is_number(initial_state) do
    " I am started with the state #{initial_state}" |> IO.puts
    { :ok, initial_state }
  end

  def init(_) do
    {:stop, "The initial state is not a number :("}
  end

  # Synchronous request
  def handle_call(:result, _, current_state) do
    {:reply, current_state, current_state}
  end

  def terminate(reason, current_state) do
    IO.puts "Terminated!"
    reason |> IO.inspect
    current_state |> IO.inspect
  end

  #Asynchronous request use "cast"
  def handle_cast(:sqrt, current_state) do
    {:noreply, :math.sqrt(current_state)}
  end

  def handle_cast({:add, number}, current_state) do
    {:noreply, current_state + number}
  end
end

{:ok, _} = Demo.start(7)
Demo.sqrt |> IO.inspect
Demo.add(7) |> IO.inspect # send something different than a number and it will call terminate
Demo.result |> IO.inspect
