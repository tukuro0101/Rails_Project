Rails.application.routes.draw do
  get 'pages/about'
  get 'about', to: 'pages#about'
end
