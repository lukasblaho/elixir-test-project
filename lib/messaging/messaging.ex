defmodule Messaging do
  use GenServer

  def start_link(opt) do
    GenServer.start_link(Messaging, opt, name: Messaging)
  end

  def init(_) do
    options = [
      name: :pulsar_app,
      host: [{:localhost, 8080}],
      producer: [
        persistence: "persistent",
        tenant: "public",
        namespace: "test",
        topic: "test"
      ],
      consumer: [
        tenant: "public",
        namespace: "test",
        topic: "test",
        subscription: "rss-feed",
        handler: Messaging.Consumer
      ]
    ]

    Stargate.Supervisor.start_link(options)
  end

  def handle_info(msg, state) do
    IO.inspect(msg)
    IO.inspect(state)
    {:noreply, state}
  end
end
