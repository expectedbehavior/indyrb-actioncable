class SessionsController < ApplicationController

  def new
    # render /app/views/sessions/new.html.erb
  end

  def create
    cookies.signed[:username] = params[:session][:username]
    ActionCable.server.broadcast("stats", kind: "login")
    redirect_to messages_path
  end

  def logout
    cookies.delete(:username)
    ActionCable.server.broadcast("stats", kind: "logout")
    redirect_to new_session_path
  end
end
