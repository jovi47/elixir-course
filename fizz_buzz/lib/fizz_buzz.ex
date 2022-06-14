defmodule FizzBuzz do
  def build(file_name) do
    File.read(file_name) |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      String.split(result, ",")
      |> Enum.map(&convert_and_evaluete_numbers/1)
    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "File not founded: #{reason}"}

  defp convert_and_evaluete_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
