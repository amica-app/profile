defmodule Civile.MixProject do
  use Mix.Project

  def project do
    [
      app: :civile,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:riak_core, :logger],
      mod: {Civile, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      #{:uniendo, git: "git://github.com/marianoguerra/uniendo.git", branch: "master"}
      {:riak_core, "~> 0.10.0", hex: :riak_core_lite},
      {:riak_core_lite_util, "~> 0.1.0"}
    ]
  end

  defp releases do
    [
      dev: [],
      node1: [],
      node2: [],
      node3: [],
      node4: []
    ]
  end
end
