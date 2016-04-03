Rails.application.routes.draw do
  root 'users#index'
  get '/logout' => 'application#logout'
  resources :users
end
