defmodule Geoip.PageController do
  use Geoip.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
