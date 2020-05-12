Rails.application.routes.draw do
  # Welcome, Pages
  root 'welcome#index'
  
  # User, Auth, Devise
  devise_for :users
end
