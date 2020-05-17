Rails.application.routes.draw do
  get 'pages/home'
  # Pages
  root 'pages#home'
end
