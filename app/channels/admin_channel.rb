class AdminChannel < ApplicationCable::Channel
  def subscribed
    stream_from "admin"
  end

  def whatver
    ActionCable.server.broadcast(
      "admin",
      event: "logout"
    )
  end
end
