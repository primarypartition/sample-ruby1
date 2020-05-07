Rails.application.routes.draw do  
  # Page Routes
  root 'pages#home'  
  get 'about', to: 'pages#about'

  # Article Routes
  resources :articles  
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  # User Routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]    	
end
