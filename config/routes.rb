Rails.application.routes.draw do
  resources :ordered_arts
  resources :orders
  resources :arts
  resources :clients
  resources :artists

  patch '/add_to_cart', to:"cart#update"

  post '/empty_the_cart', to:"cart#empty"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
