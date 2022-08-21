defmodule Messaging.Consumer do
  use Stargate.Receiver.MessageHandler

  def handle_message(%Stargate.Message{} = message) do
    IO.inspect("mam spravu")
    IO.inspect(message)
    :continue
  end
end
