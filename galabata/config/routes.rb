Rails.application.routes.draw do
  # Chatroom
  root 'chatroom#index' 	
  
  # Auth
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Users
  resources :users
  
  # Messages
  post 'message', to: 'messages#create'
  
  # WebSocket - Channel'sCable
  mount ActionCable.server, at: '/cable'
end
