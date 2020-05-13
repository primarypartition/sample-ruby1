Rails.application.routes.draw do
  # Welcome, Pages
  root 'welcome#index'
  
  # User, Auth, Devise
  devise_for :users
  get 'my_portfolio', to: 'users#my_portfolio'
  
  # Stock
  get 'search_stock', to: 'stock#search'
end
