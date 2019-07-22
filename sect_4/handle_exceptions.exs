defmodule Demo do
  # try-rescue example
  def run do
    try do
      Keyword.fetch!([a: 6], :a) # if we dont use the bang ! there will no provide an error and we can use just keys
      # this is recommended for exceptional failures as connect to a database or connect to a third party api
    rescue
      #e in KeyError -> e
      KeyError -> IO.puts("Key can not be found")
      ArgumentError -> "...."
    after #finally, ensure
      IO.puts("I am executed no matter what")
    else # executed only if there were no errors
      5 -> "found five"
      6 -> "six found this time"
      :soy_atom -> "the atom found"
      _ -> "not sure what is that"
    end
  end

  #custom error
  def run2 do
    raise ArgumentError, message: "my personal error"
  end

  # custom exception
  defexception message: "Error from demo"
  def run3 do
    raise Demo
  end

  #try catch
  def run4 do
    try do
      throw "value_thrown"
    catch
      "value_thrown" -> "cogio el error"
      _ -> "no cogió nada"
    end
  end

  #try catch raisen exits
  def run5 do
    try do
      # exit :normal  # normal exit of the process
      exit :idk # :very_bad
    catch
      :exit, :very_bad -> "exited, because of something very bad"
      :exit, _ -> "exited, VERY VERY BAD very bad"

    end
  end

end


#Demo.run |> IO.inspect
Demo.run5 |> IO.inspect
