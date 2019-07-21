defmodule Demo do

  # Lists build in function Demos
  def delete do
    List.delete_at(list(), 2)
  end

  def flatten do
    List.flatten [[1,2,3], [4,5,6], [7,8,9], list()]
  end

  def first do
    List.first list()
  end

  def last do
    List.last list()
  end

  def insert do
    List.insert_at(list(), 2, "new value")
  end

  # Enum build in functions demos
  def all do
    list() |> Enum.all?(&Kernel.is_integer/1)
  end

  def each do
    list() |> Enum.each(&IO.puts/1)
  end

  def mapList do
    list() |> Enum.map(&(&1 * 2))
  end

  def reduce do
    list() |> Enum.reduce(0, &(&1 + &2))
  end

  def max do
    list() |> Enum.max
  end

  # Maps build in function demos
  def get do
    Map.get map(), :fake
  end

  def has_key do
    Map.has_key?(map(), :fake)
  end

  def merge do
    map() |> Map.merge(%{some: "data"})
  end

  def keys do
    map() |> Map.keys
  end

  def pattern_matching do
    %{title: my_title} = map()
    my_title
  end

  def update do
    %{map() | title: "new title", year: 2019}
  end

  # Keyword list build in function demos
  def access do
    keyword_list() |> Keyword.get(:color)
  end

  def access_all_sizes do
    keyword_list() |> Keyword.get_values(:size)
  end

  # Type used
  def list do
    [1, 2, 3, 4, 5, 6]
  end

  def map do
    %{title: "Titanic", year: 1998}
  end

  def keyword_list do
    [color: :red, size: 10, size: 400]
  end

end

  Demo.access_all_sizes |>
  IO.inspect
