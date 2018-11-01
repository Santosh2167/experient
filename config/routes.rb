Rails.application.routes.draw do
  resources :businesses do
    resources :products
  end
  devise_for :users, controllers:  { registrations: 'registrations' }
 
  root "products#index"

  get 'profile', to: 'main#show'
  post 'profile', to: 'main#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
 