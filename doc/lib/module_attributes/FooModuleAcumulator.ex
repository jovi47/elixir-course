defmodule FooModuleAcumulator do
  #this will accumulate the param into [:bar, :foo] lol
  Module.register_attribute __MODULE__, :param, accumulate: true
  @param :foo
  @param :bar
  def see_params_value, do: @param

end
