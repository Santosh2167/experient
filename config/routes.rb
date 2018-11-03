Rails.application.routes.draw do
  root "products#index"
  get "search/search_result", to:"search#search_result", as: "search_result"
  get "products/:id", to:"products#show", as: "product_show"
  get "search/advanced_search",to: "search#advanced_search", as:"advanced_search"
  post "search/advanced_search", to: "search#advanced_search_process"
  # get "movies/new", to: "movies#new", as: 'new_movie'
  resources :businesses do
    resources :products
  end
  devise_for :users, controllers:  { registrations: 'registrations' }
 
  root "products#index"

  get 'profile', to: 'main#show'
  post 'profile', to: 'main#update'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
 