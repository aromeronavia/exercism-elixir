defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do "" end
  def encode(string) do
    get_coincidences(string)
  end

  defp get_coincidences(string) do
    characters = string
    |> String.graphemes

    {coincidences, actual, repetition} = characters
    |> Enum.reduce({"", Enum.at(characters, 0), 0},
      fn (char, structure) ->
        {holder, actual, repetitions} = structure
        cond do
          actual == char ->
            {holder, actual, repetitions + 1}
          actual != char ->
            {holder <> to_string(repetitions) <> actual, char, 1}
        end
    end)
    coincidences <> to_string(repetition) <> actual
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    {decoded, _} = to_char_list(string)
    |> Enum.reduce({"", ""}, fn char, acc ->
      {holder, number} = acc
      if char_is_number(char) do
        {holder, number <> <<char>>}
      else
        {holder <> String.duplicate(<<char>>, String.to_integer(number)), ""}
      end
    end)
    decoded
  end

  defp char_is_number(character) do
    character >= 48 and character <= 57
  end
end
