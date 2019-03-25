Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
