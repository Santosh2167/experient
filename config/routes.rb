Rails.application.routes.draw do
  devise_for :users
  root "main#home"

  get 'profile', to: 'main#show'
  post 'profile', to: 'main#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 