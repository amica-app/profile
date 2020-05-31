# Civile

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `civile` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:civile, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/civile](https://hexdocs.pm/civile).

mix deps.get
mix compile

rm -rf data_* data ring_data_dir*


3 Node Cluster Setup
Let's build a 3 node cluster on our machine.

First we need to create 3 slighly different releases, the only differences are the ports they listen to and the node names, since we are running them on the same machine we don't want them to clash.

For that we can run:

MIX_ENV=node1 mix release node1
MIX_ENV=node2 mix release node2
MIX_ENV=node3 mix release node3
Now open 3 terminals, on each run one of the following commands:

./_build/node1/rel/node1/bin/node1 start_iex
./_build/node2/rel/node2/bin/node2 start_iex
./_build/node3/rel/node3/bin/node3 start_iex
On node2 and node3 run:

:riak_core.join('node1@127.0.0.1')
On node1 run:

To see the planned changes in the ring:

:riak_core_claimant.plan()
Now we can commit the plan:

:riak_core_claimant.commit()
Periodically run:

:riak_core_console.member_status([])
You will see something like this:

================================= Membership ==================================
Status     Ring    Pending    Node
-------------------------------------------------------------------------------
valid      46.9%     34.4%    'node1@127.0.0.1'
valid      26.6%     32.8%    'node2@127.0.0.1'
valid      26.6%     32.8%    'node3@127.0.0.1'
-------------------------------------------------------------------------------
Valid:3 / Leaving:0 / Exiting:0 / Joining:0 / Down:0
:ok
Once it finishes rebalancing it will look like this:

================================= Membership ==================================
Status     Ring    Pending    Node
-------------------------------------------------------------------------------
valid      34.4%      --      'node1@127.0.0.1'
valid      32.8%      --      'node2@127.0.0.1'
valid      32.8%      --      'node3@127.0.0.1'
-------------------------------------------------------------------------------
Valid:3 / Leaving:0 / Exiting:0 / Joining:0 / Down:0

# Playing with data

From node2:

iex(dev2@127.0.0.1)3> Civile.Service.get(:k1)
{:ok, :"dev1@127.0.0.1",
 913438523331814323877303020447676887284957839360, nil}
From node3:

iex(dev3@127.0.0.1)12> Civile.Service.put(:k1, 42)
{:ok, :"dev1@127.0.0.1",
 913438523331814323877303020447676887284957839360, nil}
From node2:

iex(dev2@127.0.0.1)4> Civile.Service.get(:k1)
{:ok, :"dev1@127.0.0.1",
 913438523331814323877303020447676887284957839360, 42}
