defmodule Demo do
  defmacro work(argument) do #macros can be private too
    argument |> IO.inspect
  end

  defmacro work2(argument) do
    quote do
      unquote(argument) * 10
    end
  end

  defmacro macro_palindrome?(str, expr) do
    quote do
      if (unquote(str) == String.reverse(unquote(str))) do
        unquote(expr)
      end
    end
  end

  def palindrome?(str, expr) do
    if str == String.reverse(str), do: expr
  end
end

defmodule Playground do
  require Demo

  def test! do
    Demo.work({1,2,3,4,5}) |> elem(2) |> IO.inspect
  end

  def test2! do
    Demo.work2(2) |> IO.inspect
  end

  def test3! do
    Demo.macro_palindrome?("asddsa", IO.puts("is palindrome"))
  end

end

Playground.test3!
