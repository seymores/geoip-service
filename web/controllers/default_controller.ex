defmodule Geoip.DefaultController do
  use Geoip.Web, :controller

  def index(conn, params) do
    conn |> put_status(400) |> json %{error: "Invalid input, no IP address given"}
  end

  def index(conn, %{"ip" => ip}) do
    conn |> json "hello world #{ip}"
  end

end