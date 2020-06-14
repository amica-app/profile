# Profile App

Profile App that provides profile features for Amica Application.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* Riak - See Riak repo wiki for information

To get started, run the following commands in your project folder:

```shell
cp config/dev.exs.example config/dev.exs  # creates the project's configuration file
mix deps.get  # installs the dependencies
mix phx.server  # run the application.
OR
iex -S mix phx.server # run the application in iex
```

This is a backend project, you won't be able to go to localhost:5000 and see an aplication. 

In order to see the UI frontend you will need to download and setup. TODO

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```

## Documentation

To generate the documentation, your can run in your terminal:

```shell
mix docs
```

This will generate a `doc/` directory with a documentation in HTML. To view the documentation, open the `index.html` file in the generated directory.

# Using the API

## Get a Profile 
GET to /profiles/username

## Search a Profile

GET to /search/username

## Setup Test Data

GET to /setup/username

# From the command line

{:ok, pid} = Riak.Connection.start_link('192.168.2.175', 8087)

o = Riak.find(pid, "profile", "joe@example.com")


