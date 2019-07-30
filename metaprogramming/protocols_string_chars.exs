defmodule Employee do
  defstruct name: "", salary: 0

  defimpl String.Chars do # Implement the protocol String Chars to the Employee struct so we can use IO.puts
    def to_string(%Employee{name: name, salary: salary}) do
      "Name: #{name}, Salary:#{salary}"
    end
  end
end

defmodule Demo do
  def work do
    %Employee{name: "Pablo", salary: 1000} |> IO.puts
  end
end

Demo.work()
