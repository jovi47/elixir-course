defmodule Macros.Hygiene do
  defmacro interference do
    quote do: var!(a) = 1
  end
end

defmodule HygieneTest do
  def go do
    require Macros.Hygiene
    _a = 13 #this will do nothing because of the interference
    Macros.Hygiene.interference()
    a
  end
end

HygieneTest.go
