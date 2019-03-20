Rails.application.routes.draw do
  get 'signup',to:"signup#signup"
  get 'signin',to:"signin#signin"
  get 'welcome/index'
  get 'friends',to: 'friends#view'
  get 'friends/add'
  get 'home',to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
end
