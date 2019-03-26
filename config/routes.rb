Rails.application.routes.draw do
  get 'carts/index'
  resources :ordered_arts
  resources :orders
  resources :arts
  resources :clients
  resources :artists

  root 'welcome#index'
  get '/about', to: "welcome#about"
  # get '/clients/login', to: "sessions#client_login"
  # get '/artists/login', to: "sessions#artist_login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  # root "welcomes#index"

  patch '/add_to_cart', to:"carts#update"

  get '/empty_the_cart', to:"carts#empty"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
