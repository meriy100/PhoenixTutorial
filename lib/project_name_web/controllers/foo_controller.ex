defmodule ProjectNameWeb.FooController do
  use ProjectNameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", foo: "bar2"
  end
end
