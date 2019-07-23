defmodule Demo do
  def work(number) do
    :timer.sleep 5000
    IO.puts "I run after 5 seconds #{number}"
  end

  def run(number) do
    spawn fn ->
      work(number) # number is deeply copied, process don't share memory
    end
  end

  #run several processes
  def work2(number, index) do
    pid = spawn fn ->
      :timer.sleep 5000
      IO.puts(" #{index}: result is #{number * index}")
    end
    pid |> IO.inspect
  end

  def run2(number) do
    Enum.each 1..5, &(work2(number, &1))
  end

end

#Demo.run
#spawn Demo, :run, []
#Demo.run(7) # closure for the process
Demo.run2(7)
|> IO.inspect
IO.puts "doing something else"
