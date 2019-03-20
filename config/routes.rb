Rails.application.routes.draw do
  get 'friends',to: 'friends#view'
  get 'friends/add'
  get 'home',to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
