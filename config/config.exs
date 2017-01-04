# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :geoip,
  ecto_repos: [Geoip.Repo]

# Configures the endpoint
config :geoip, Geoip.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Oce++G748xW1EibwERsZ+1irmgJtgXyhNKd0Qq9z+DFfZF2Bn9411oJd9XSUJiVZ",
  render_errors: [view: Geoip.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Geoip.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :geolix,
  databases: [
    %{
      id:      :city,
      adapter: Geolix.Adapter.MMDB2,
      source:  "data/GeoLite2-City.mmdb"
    },
    %{
      id:      :country,
      adapter: Geolix.Adapter.MMDB2,
      source:  "data/GeoLite2-Country.mmdb"
    }
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
