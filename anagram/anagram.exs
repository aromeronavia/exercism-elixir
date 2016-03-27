defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    string = base |> String.downcase |> sort_string
    candidates
    |> Enum.filter(fn word ->
      word |> String.downcase |> sort_string == string
      and base |> String.downcase != word |> String.downcase
    end)
  end

  def sort_string(string) do
    String.graphemes(string)
    |> Enum.sort
    |> List.to_string
  end
end

matches = Anagram.match "Orchestra", ~w(cashregister carthorse radishes)
IO.puts matches