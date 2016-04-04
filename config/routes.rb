Rails.application.routes.draw do
  resources :orders
  root 'users#index'
  get '/logout' => 'application#logout'
  resources :users
end
