Rails.application.routes.draw do
  resources :articles
  
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  get 'about', to: 'pages#about'
	
  root 'pages#home'
	
end
