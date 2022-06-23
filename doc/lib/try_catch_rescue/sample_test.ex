defmodule TryCatchRescue.SampleTest do
  require Logger
  def rescuing_an_error_and_treating() do
    try do
      File.read!("will_crach.txt")
    rescue
      e -> raise e
    after
      IO.puts "I did my job"
    end
  end

  def without_even_trying do
    try do
      raise "oops"
    rescue
      e -> raise "some thing ocurred #{inspect e}"
    after
      IO.puts "cleaning up!"
    end
  end

  def else_sample(x) do
    try do
      1 / x
    rescue
      ArithmeticError -> #raise TryCatchRescue.ExceptionSample.exception("nem imagina")
      :infinity
    else
      result when result < 1 and result > -1 -> :small
      _ -> :large
    end
  end

  def catching do
    try do
      exit("lol")
      :error
    catch
      :error, _ -> raise "i told"
      :exit, _ -> "catched on the exit, noob?"
    end
  end
end
