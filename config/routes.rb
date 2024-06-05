Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  get '/products', to: 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"
end
