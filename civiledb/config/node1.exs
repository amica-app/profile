use Mix.Config

# config :riak_core,
#   node: 'dev1@127.0.0.1',
#   web_port: 8198,
#   handoff_port: 8199,
#   ring_state_dir: 'ring_data_dir_1',
#   platform_data_dir: 'data_1'

config :riak_core,
  ring_state_dir: 'data/node1/data_riak_core',
  platform_data_dir: 'data/node1/data_riak_core',
  ring_creation_size: 64,
  handoff_port: 8199
