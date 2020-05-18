Rails.application.routes.draw do
  # Pages
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # Courses
  resources :courses
  get 'courses/new', to: 'courses#new'
  get 'courses/', to: 'courses#index'
  post 'course_enroll', to: 'courses#enroll'
  
  # Users
  resources :users
  
  # Account
  get 'login', to: 'accounts#new'
  post 'login', to: 'accounts#create'  
  delete 'logout', to: 'accounts#destroy'  
end
