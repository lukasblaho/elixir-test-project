defmodule RestApi.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    url = "ws://localhost:8080/ws/v2/producer/persistent/public/test/test"
    Stargate.produce(url, [{"kluc", "hodnota"}]) |> IO.inspect()

    # Stargate.produce(Messaging, [{"kluc", "hodnota"}]) |> IO.inspect
    send_resp(conn, 200, "iiiha")
  end

  get "/con" do
    url = "ws://localhost:8080/ws/v2/producer/persistent/public/test/test"
    Stargate.produce(url, [{"kluc", "hodnota"}]) |> IO.inspect()

    # Stargate.produce(Messaging, [{"kluc", "hodnota"}]) |> IO.inspect
    send_resp(conn, 200, "maaam")
  end

  match _ do
    send_resp(conn, 404, "Not foud")
  end
end
