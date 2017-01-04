defmodule Geoip.Router do
  use Geoip.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Geoip do
    pipe_through :api # Use the default browser stack

    get "/:ip", DefaultController, :index
    get "/", DefaultController, :index
  end

end
