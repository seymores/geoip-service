defmodule Geoip.DefaultController do
  use Geoip.Web, :controller
  require Logger

  def index(conn, %{"ip" => ip}) do
    case Geolix.lookup(ip, [as: :raw]) do
      nil -> conn |> put_status(404) |> json(%{error: "Invalid IP or no data availble for the IP address"})
      data -> conn |> json(load_ouput(data))
    end
  end

  def index(conn, _params) do
    conn |> put_status(400) |> json(%{error: "Invalid input, no IP address given"})
  end

  defp load_ouput(data) do
    city = get_in(data, [:city, :city, :names, :en])
    continent = get_in(data, [:city, :continent, :names, :en])
    country = get_in(data, [:country, :country, :names, :en])
    iso_code = get_in(data, [:country, :country, :iso_code])
    ip = get_in(data, [:country, :ip_address]) |> Tuple.to_list |> Enum.join(".")
    location = get_in(data, [:city, :location])
    %{country: country, city: city, iso_code: iso_code, continent: continent, ip: ip, location: location}
  end

end

