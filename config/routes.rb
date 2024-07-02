Rails.application.routes.draw do
  get 'pages/about'
  get 'about', to: 'pages#about'

  resources :coffee_shops
  resources :customers
  resources :reviews

  # Define the root route
  root 'pages#about#index'
end
