# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mix_deploy_example,
  ecto_repos: [MixDeployExample.Repo]

config :pooler, pools:
  [
    # [
    #   name: :riaklocal1,
    #   group: :riak,
    #   max_count: 10,
    #   init_count: 5,
    #   start_mfa: { Riak.Connection, :start_link, [] }
    # ], 
    
    [
      name: :riaklocal2,
      group: :riak,
      max_count: 15,
      init_count: 2,
      start_mfa: { Riak.Connection, :start_link, ['localhost', 8087] }
    ]
  ]

# Configures the endpoint
config :mix_deploy_example, MixDeployExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kKmkJvg50YUXzSWk8TRul9Bkd6KELsR/FzR2Y4Nuzl9EWgxMAaQkCOVkPvQ+VzDw",
  render_errors: [view: MixDeployExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MixDeployExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
