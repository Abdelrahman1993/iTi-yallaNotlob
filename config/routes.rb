Rails.application.routes.draw do
  get 'signup',to:"signup#signup"
  get 'signin',to:"signin#signin"
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
