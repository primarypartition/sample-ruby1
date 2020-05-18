Rails.application.routes.draw do
  # Pages
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # Courses
  get 'courses/new', to: 'courses#new'
  get 'courses/', to: 'courses#index'
end
