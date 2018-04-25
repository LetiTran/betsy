Rails.application.routes.draw do

  root 'products#root', as: 'homepage'

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create', as: 'auth_callback'
  get '/auth/github', as: 'github_login'

  #sessions
  delete '/login', to: 'sessions#destroy', as: 'logout'
  get '/cart', to: 'orderproducts#index', as: 'cart'
  get 'orderproducts/clearcart', to: 'orderproducts#clear_cart', as: 'clearcart'

  # Reviews:
  resources :reviews

  # Products:
  resources :products

  resources :products do
    # add orderproducts (cart#index)
    resources :categories, only: [:index]
    resources :reviews, only: [:new,:create]
    # resources :merchants, only: [:index]
    resources :categories, only: [:index]
    resources :orderproducts
  end

  # Merchants:
  resources :merchants do
    resources :products, only: [:index]
    resources :orders, only: [:index]
  end

  # Categories:
  resources :categories

  # Orders:
  resources :orders

  # orderproducts:
  resources :orderproducts
end
