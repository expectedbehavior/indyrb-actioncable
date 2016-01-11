class MessagesController < ApplicationController

  def index
    # render /app/views/messages/index.html.erb
  end

  def create
    ActionCable.server.broadcast(
      "messages",
      username: cookies.signed[:username],
      message: params[:message][:body],
    )
    ActionCable.server.broadcast("stats", kind: "message")
    head :ok
  end

end
