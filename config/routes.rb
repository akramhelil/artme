Rails.application.routes.draw do
  get 'carts/index'
  resources :ordered_arts
  resources :orders
  resources :arts
  resources :clients
  resources :artists

  # root "welcomes#index"

  patch '/add_to_cart', to:"carts#update"

  get '/empty_the_cart', to:"carts#empty"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
