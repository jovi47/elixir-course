defprotocol Protocols.Describe do

  @fallback_to_any true
  def describe(struct)
end

defimpl Protocols.Describe, for: [Protocols.Human, Protocols.Child] do
  def describe(human) do
    "I'm only a human, and my name is #{human.name}"
  end
end

defimpl Protocols.Describe, for: Protocols.Pet do
  def describe(pet) do
    "I'm a #{pet.type}, and my name is #{pet.name}"
  end
end

defimpl Protocols.Describe, for: Any do
  def describe(struct) do
    {:error, "Not supported yet to #{inspect struct}"}
  end
end
