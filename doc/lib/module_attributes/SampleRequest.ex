defmodule MyApp.Status do
  @service URI.parse("https://example.com")
  def status(_email) do
    SomeHttpClient.get(@service)
  end
end

#equivalent to
"""
defmodule MyApp.Status do
  def status(_email) do
    SomeHttpClient.get(%URI{
      authority: "example.com",
      host: "example.com",
      port: 443,
      scheme: "https"
    })
  end
end
"""
