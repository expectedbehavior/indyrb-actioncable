class SessionsController < ApplicationController

  def new
    # render /app/views/sessions/new.html.erb
  end

  def create
    cookies.signed[:username] = params[:session][:username]
    redirect_to messages_path
  end

  def logout
    cookies.delete(:username)
    redirect_to new_session_path
  end
end
