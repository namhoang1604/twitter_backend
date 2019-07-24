use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :twitter_server, TwitterServerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :twitter_server, TwitterServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "twitter_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
