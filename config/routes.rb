Rails.application.routes.draw do

  devise_for :users
  resources :orders
  resources :groups
  
  resources :friends


  resources :users do
    resources :friends
  end

# namespace :users do
#   resources :friends
# end
  resources :users
  
  resources :groups do
    resources :users
  end

  

  get 'signup' , to:"users#signup"
  get 'signin' , to:"users#signin"

  root 'home#home'
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
