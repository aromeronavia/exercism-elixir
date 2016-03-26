defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([h | t]) do
    1 + count(t)
  end
  def count(number) do 0 end

  @spec reverse(list) :: list
  def reverse([]) do [] end
  def reverse(list) do
    _reverse(list)
    |> List.flatten
  end

  defp _reverse([h | t]) do
    [_reverse(t) | [h]]
  end
  defp _reverse([]) do [] end

  def map([h | t], fun) do
    [fun.(h) | map(t, fun)]
  end

  def map([], fun) do [] end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([h | t], fun) do
    _filter([h | t], fun)
    |> List.flatten
  end

  def filter([], fun) do [] end

  def _filter([h | t], fun) do
    if fun.(h) do
      [h | _filter(t, fun)]
    else
      [_filter(t, fun)]
    end
  end

  def _filter([], fun) do [] end
  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f) do acc end
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([h | t], acc, fun) do
    reduce(t, fun.(h, acc), fun)
  end
  defp _reduce([], acc, fun) do 0 end

  @spec append(list, list) :: list
  def append(a, b) do
    [a | b]
    |> List.flatten
  end

  @spec concat([[any]]) :: [any]
  def concat([]) do [] end
  def concat([h | t]) do
    append(h, concat(t))
  end
end
