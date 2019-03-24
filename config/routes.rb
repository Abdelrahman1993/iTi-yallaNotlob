Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  # devise_for :users
  resources :orders do
  resources :user_order_participation , path: 'orderdata'
  # resources :orderdata, controller: 'user_order_participation'
    # delete 'delete/:id(.:format)', :to => 'user_order_participation#destroy'
  end


  resources :groups

  resources :users
  
  resources :groups do
    resources :users
  end

  

  get 'signup' , to:"users#signup"
  get 'signin' , to:"users#signin"

  root 'home#home'
  
  get 'friends', to: 'friends#view'

  get 'friends/add'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
