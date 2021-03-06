Rails.application.routes.draw do

  get 'notifications/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
mount ActionCable.server => "/cable"


  # devise_for :users
  resources :orders do
  resources :user_order_participation , path: 'orderdata'
  end

  post '/orders/:order_id/orderdata/deleteUserInvited/:id/:orderId' , to: 'user_order_participation#deleteUserInvited'


  resources :groups
  resources :user_order_invitations

  # resources :groups
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

  
  resources :notifications
  
  get 'signup' , to:"users#signup"
  get 'signin' , to:"users#signin"

  root 'home#home'
  
  get 'friends', to: 'friends#view'

  get 'friends/add'




  get '/groups/:id', to: 'groups#index', as: 'groupId'
  # get 'groups/:id/users/:id' to: 'users#destroy'
  
  post 'groups/addUserGroup', to: 'groups#addUserGroup'
  # get "/groups/:id", to: "groups#index"
  # get '/groups/:id', to: :index, controller: 'groups'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
