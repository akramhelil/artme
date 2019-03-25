Rails.application.routes.draw do
  resources :ordered_arts
  resources :orders
  resources :arts
  resources :clients
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
