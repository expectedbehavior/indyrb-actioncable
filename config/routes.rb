Rails.application.routes.draw do
  ### Setup a simple messaging server
  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create] do
    get :logout, on: :collection
  end
  ### Login page is the default
  root "sessions#new"

  # Serve websocket cable requests in-process
  mount ActionCable.server => "/cable"
end
