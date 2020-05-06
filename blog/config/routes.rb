Rails.application.routes.draw do
  resources :articles
  
  # resources :articles, only: [:show, :index, :new, :create]
  
  get 'about', to: 'pages#about'
	
  root 'pages#home'
	
end
