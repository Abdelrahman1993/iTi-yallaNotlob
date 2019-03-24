Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
mount ActionCable.server => "/cable"

  # devise_for :users
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
  
  get '/groups/:id', to: 'groups#index', as: 'groupId'
  
  post 'groups/addUserGroup', to: 'groups#addUserGroup'
  # get "/groups/:id", to: "groups#index"
  # get '/groups/:id', to: :index, controller: 'groups'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
