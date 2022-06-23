defmodule Protocols.Human do
  # @derive [Protocols.Describe], this you go to any implementation lol
  defstruct [:name,:age, :sex]
end

defmodule Protocols.Child do
  defstruct [:name,:age, :sex]
end
