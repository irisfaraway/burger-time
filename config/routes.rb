Rails.application.routes.draw do
  resources :drinks
  resources :dips
  resources :burgers
  resources :fillings
  resources :sides
  resources :orders
  resources :users
  root 'orders#index'
  get '/logout' => 'application#logout'
end
