defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      _contains?(a, b) -> :superlist
      _contains?(b, a) -> :sublist
      a !== b -> :unequal
    end
  end

  defp _contains?([], _) do false end
  defp _contains?(superlist, sublist) do
    sublist_len = length sublist

    if Enum.slice(superlist, 0, sublist_len) === sublist, do: :superlist,
    else: _contains?(tl(superlist), sublist)
  end
end
