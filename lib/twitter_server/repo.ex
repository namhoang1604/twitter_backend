defmodule TwitterServer.Repo do
  use Ecto.Repo,
    otp_app: :twitter_server,
    adapter: Ecto.Adapters.Postgres
end
