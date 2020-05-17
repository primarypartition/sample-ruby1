Rails.application.routes.draw do
  # Devise
  devise_for :users
  
  # Pages
  root 'pages#home'  
end
