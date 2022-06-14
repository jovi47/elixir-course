defmodule ExMonApiWeb.WelcomeController do
  use ExMonApiWeb, :controller

  def index(conn, _) do
    text(conn, "Welcome to ExMonApiWeb!")
  end
end
