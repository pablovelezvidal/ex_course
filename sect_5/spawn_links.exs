defmodule Demo do
  # Link two processes, the communication is bidirectional
  def work do
    IO.puts "Doing some work..."
    exit :error
  end

  def run do
    spawn_link fn -> work() end #link the run process to the new process created via spawn link that calls the work function
  end

  # Link two processes and trap the exits from one into the other, the comm is bidirectional
  def work2 do
    IO.puts "Run 2 doing something"
    exit :error
  end

  def run2 do
    Process.flag :trap_exit, true
    spawn_link fn -> work2() end

    receive do
      response -> IO.inspect response
    end

    IO.puts "Doing something else"
  end

  # Monitor a particular process from another
  def work3 do
    IO.puts "Work 3 doing something"
    exit :error
  end

  def run3 do
    # pid = spawn fn -> work3() end #just use spawn
    # Process.monitor pid #with this is monitored
    spawn_monitor(Demo, :work3, []) #another way to rewrite the two above lines

    receive do
      msg -> IO.inspect msg
    end
    IO.puts "Doing something else"
  end

end

Demo.run3
