defmodule Debugging do
  # Started the debugging in the iex -S mix using the :debugger.start() command and added a breakpoint via
  # :int.ni(Debugging) && :int.break(Debugging, lineNumber)
  def double_sum(x, y) do
    hard_work(x, y)
  end

  defp hard_work(x, y) do
    x = 2 * x
    y = 2 * y
    x + y
  end
end
