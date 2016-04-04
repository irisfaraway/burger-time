Rails.application.routes.draw do
  resources :sides
  resources :orders
  resources :users
  root 'orders#index'
  get '/logout' => 'application#logout'
end
