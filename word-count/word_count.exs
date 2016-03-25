defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    clean_punctiation(sentence)
    |> String.split(~r/[ ]|_/)
    |> Enum.reduce(%{}, fn(word, wordsMap) ->
      word = String.downcase(word)
      if word != "" do
        if !Map.has_key?(wordsMap, word)do
          Map.put(wordsMap, word, 1)
        else
          Map.put(wordsMap, word, wordsMap[word] + 1)
        end
      else
        wordsMap
      end
    end)
  end

  def clean_punctiation(sentence) do
    [",", "!", "&", "@", "$", "%", "^", ":"]
    |> Enum.reduce(sentence, fn(char, acc) ->
      String.replace(acc, char, "")
    end)
  end
end
