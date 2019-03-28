Rails.application.routes.draw do
  get 'carts/index'
  resources :ordered_arts, only: [:index, :new]
  resources :arts
  resources :clients, except: :index
  resources :artists

  root 'welcome#index'
  get '/about', to: "welcome#about"


  patch '/add_to_cart', to:"carts#update"
  get '/empty_the_cart', to:"carts#empty"
  get '/check_out', to:'carts#check_out'


  get '/login/artist', to:'sessions#artist_new'
  post '/login/artist', to:'sessions#artist_login'
  delete '/logout/artist', to: "sessions#artist_logout"


  get '/login', to:'sessions#new'
  delete '/logout', to:'sessions#client_logout'
  post '/login', to:'sessions#client_login'

  #order_history
  get 'clients/:id/order_history', to:'sessions#order_history'
  get 'artists/:id/order_list', to:'sessions#order_list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
