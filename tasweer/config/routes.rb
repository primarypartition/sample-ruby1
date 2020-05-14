Rails.application.routes.draw do
  # Auth
  devise_for :users
  
  # Pages
  root 'pages#home'
end
