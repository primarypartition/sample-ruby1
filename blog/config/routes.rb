Rails.application.routes.draw do  
  # Page
  root 'pages#home'  
  get 'about', to: 'pages#about'

  # Article
  resources :articles  
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  # User
  get 'signup', to: 'users#new'
  resources :users, except: [:new]    

  # Auth
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'  
  
  # Category 
  resources :categories, only: [:index, :show, :new, :create, :edit, :update]
end
