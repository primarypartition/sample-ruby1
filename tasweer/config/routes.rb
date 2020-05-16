Rails.application.routes.draw do
  # Auth
  devise_for :users, :controllers => { :registrations => 'registrations' }  
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  # Pages
  root 'pages#home'
end
