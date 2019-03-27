defmodule PhoenixTutorial.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_tutorial,
    adapter: Ecto.Adapters.Postgres
end
