Rails.application.routes.draw do

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create', as: 'auth_callback'
  get '/auth/github', as: 'github_login'

  root 'products#root', as: 'homepage'

  #sessions
  delete '/login', to: 'sessions#destroy', as: 'logout'


  get '/cart', to:'orderproducts#index', as: 'cart'

  # Reviews:


  # Products:
  resources :products
  resources :products do
    # add orderproducts (cart#index)

    resources :categories, only: [:index]

    resources :reviews,only: [:new,:create]


    resources :reviews, only: [:new]
    # resources :merchants, only: [:index]
    resources :categories, only: [:index]


    resources :orderproducts

    resources :reviews,only: [:new,:create]

  end
  resources :reviews
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
