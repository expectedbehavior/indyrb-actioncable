class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def bongo
    ActionCable.server.broadcast(
      "messages",
      username: "bongo",
      message: "ba-dum",
    )
    ActionCable.server.broadcast("stats", kind: "bongo")
  end
end
