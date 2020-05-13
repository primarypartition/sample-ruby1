Rails.application.routes.draw do
  # User_stocks
  resources :user_stocks, only: [:create, :destroy]
  
  # Welcome, Pages
  root 'welcome#index'
  
  # User, Auth, Devise
  devise_for :users
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  resources :users, only: [:show]
  
  # Stock
  get 'search_stock', to: 'stock#search'
  
  # Friendship
  resources :friendships, only: [:create, :destroy]
end
