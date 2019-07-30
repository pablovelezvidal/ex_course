defmodule Company do
  defstruct title: "", employees: []
  # Enum has useful functions like each for recursion
  # the three functions that you have to implement protocol for enum are
  # count/1
  # member?/2
  # reduce/3
  defimpl Enumerable  do
    def count(%Company{employees: employees}) do
      {:ok, Enum.count(employees)}
    end

    def member?(%Company{employees: employees}, employee) do
      {:ok, Enum.member?(employees, employee)}
    end

    def reduce(_, {:halt, result}, _fun), do: {:halted, result}

    def reduce(%Company{employees: _employees} = company, {:suspended, result}, fun) do
      {:suspended, result,  &reduce(company, &1, fun)}
    end

    def reduce(%Company{employees: []}, {:cont, result}, _fun), do: {:done, result}

    def reduce(%Company{employees: [head | tail]}, {:cont, result}, func) do
      reduce(%Company{employees: tail}, func.(head, result), func)
    end

  end
end


defmodule Employee do
  defstruct name: "", salary: "", works_for: 0

  defimpl String.Chars do # Implement the protocol String Chars to the Employee struct so we can use IO.puts
    def to_string(%Employee{name: name, salary: salary}) do
      "Name: #{name}, Salary:#{salary}"
    end
  end
end

defmodule Demo do
  def work do
    company = %Company{
      title: "Cafeto",
      employees: [
        %Employee{name: "Pablo", salary: "150000€", works_for: 2},
        %Employee{name: "Angelica", salary: "240000€", works_for: 2},
        %Employee{name: "Margarita", salary: "35000€", works_for: 3}
      ]
    }
    Enum.count(company) |> IO.inspect
    Enum.member?(company, %Employee{name: "Pablo", salary: "150000€", works_for: 2}) |> IO.inspect

    Enum.reduce(company, 0, fn(employee, total_years) -> employee.works_for + total_years end) |>
    IO.inspect
  end
end

Demo.work()
