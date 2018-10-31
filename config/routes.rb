Rails.application.routes.draw do
  resources :businesses
  devise_for :users, controllers:  { registrations: 'registrations' }
  # devise_scope :user do
  #   get "users/new_supplier" => "registrations#new_supplier", :as => "new_supplier_registration"
  # end
  root "main#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'business/sign_up' => "businesses#sign_up"

end
 