defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizzbuzz, :fizz, 32, 32, :buzz, :fizz, 32]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, returns an error " do
      expected_error = {:error, "File not founded: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_error
    end
  end
end
