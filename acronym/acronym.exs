defmodule Acronym do
  def sanitize_string(string) do
    string
    |> String.replace("-", "")
    |> String.replace(",", "")
  end
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  def abbreviate(string) do
    string
    |> sanitize_string
    |> String.split(" ")
    |> Enum.reduce("", fn word, abbreviation ->
      word = String.to_char_list(word)
      abbreviation <> String.upcase <<Enum.at(word, 0)>> <>
      Enum.reduce(Enum.slice(word, 1, length(word)), "", fn character, acronym ->
        if character >= 65 and character <= 90 do
          acronym <> String.upcase <<character>>
        else
          acronym
        end
      end)
    end)
  end
end
