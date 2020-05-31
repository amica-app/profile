use Mix.Config

config :riak_core,
  #ring_state_dir: 'ring_data_dir',
  handoff_port: 8099,
  handoff_ip: '127.0.0.1',
  schema_dirs: ['priv'],
  ring_creation_size: 64

config :sasl,
  errlog_type: :error

import_config "#{Mix.env()}.exs"


# config :riak_core,
#   handoff_port: 8099,
#   handoff_ip: '127.0.0.1',
#   schema_dirs: ['priv'],
#   ring_creation_size: 64

# import_config "#{Mix.env()}.exs"
