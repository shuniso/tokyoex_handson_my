use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tokyoex_handson_my, TokyoexHandsonMy.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tokyoex_handson_my, TokyoexHandsonMy.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "exuser",
  password: "Exuser00)",
  database: "tokyoex_handson_my_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
