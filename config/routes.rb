Rails.application.routes.draw do

  resources :ordeers
  resources :groups


  get 'signup' , to:"users#signup"
  get 'signin' , to:"users#signin"

  root 'home#home'
  
  get 'friends', to: 'friends#view'

  get 'friends/add'
  




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
