defmodule Demo do

  #send message from one process to other
  def work do
    IO.puts "I am the work function"

    result = receive do
      {a,b} -> a * b
      message -> message
    #after 5000 -> IO.puts "I wont wait longer" # receive can wait eternally for messages
    end
    IO.puts result
  end

  def run(message) do
    pid = spawn fn ->
      work()
    end

    send pid, message # self()
  end


  # Comunicate back with the same process that creates the other process
  def work2 do
    IO.puts "Estoy en work 2"

    result = receive do
      {sender, {a,b}} -> send(sender, a * b)
    end
    IO.puts result
  end

  def run2(message) do
    pid = spawn fn ->
      work2()
    end

    send pid, {self(), message} # self() sends the current process id to the recent created process

    receive do
      response -> IO.puts "The result is: #{response}"
    end
  end

  # Send and receive several messages from several processes
  def work3() do
    spawn fn ->
      receive do
         {sender, num} ->
          :timer.sleep 1000
          send sender, num * 2
      end
    end
  end

  def run3 do
    1..5 |> Enum.each(fn(i) ->
      pid = work3()
      send pid, {self(), i}
    end)

    1..5 |> Enum.map( fn(_) -> response() end)
  end

  defp response do
    receive do
      result -> result
    end
  end

end

#Demo.run("my message")
#Demo.run({2, 3})
#Demo.run2({2,3})
Demo.run3 |> IO.inspect
