defmodule RomulusWeb.ProfileController do
  use RomulusWeb, :controller
  use RomulusWeb.GuardedController

  #alias Romulus.Accounts.{Users, User}

  action_fallback(RomulusWeb.FallbackController)

  #plug(Guardian.Plug.EnsureAuthenticated when action in [:follow, :unfollow])

  def index(conn, %{"username" => username}, current_user) do
    # TODO get rid of this method or rewrite to use a search, i think this will go in neo4j though
    #keyValue = Randomizer.randomizer(10)
        # o = Riak.Object.create(bucket: "user", key: keyValue, data: "Han Solo")
        # Riak.put(o)
        # IO.puts keyValue
    users = [
      %{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"},
      %{name: "Anne",
        email: "anne@example.com",
        password: "guessme",
        stooge: "larry"},
      %{name: "Franklin",
        email: "franklin@example.com",
        password: "guessme",
        stooge: "curly"},
    ]
    json conn, users
  end

  # def searchprofiles() do
  #   users = [
  #     %{name: "Joe",
  #       email: "joe@example.com",
  #       password: "topsecret",
  #       stooge: "moe"},
  #     %{name: "Anne",
  #       email: "anne@example.com",
  #       password: "guessme",
  #       stooge: "larry"},
  #     %{name: "Franklin",
  #       email: "franklin@example.com",
  #       password: "guessme",
  #       stooge: "curly"},
  #   ]
  #   json conn, users
  # end

  def getprofile(conn, %{"username" => username}, current_user) do
  # rewrite me to get a profile value for a key
    IO.puts "I am in show function"
    users = 
      %{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"}
    json conn, users
    # case Users.get_by_username(username) do
    #   user = %User{} ->
    #     conn
    #     |> put_status(:ok)
    #     |> render("show.json", user: user)

    #   nil ->
    #     conn
    #     |> put_status(:not_found)
    #     |> render(RomulusWeb.ErrorView, "404.json")
    # end
  end

  def setuptestdata(conn, %{"username" => username}, current_user) do
    testProfile1 = 
      %{name: "Joe",
        email: "joe@example.com",
        gender: "maile"}
    keyValue = Randomizer.randomizer(10)
    o = Riak.Object.create(bucket: "profile", key: username, data: testProfile1)
    Riak.put(o)
    
    IO.puts "Setup default data for profiles " <> username
    data = 
      %{complete: "new user data setup"}
    json conn, data
  end
end
