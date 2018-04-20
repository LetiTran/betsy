Rails.application.routes.draw do

  resources :orderproducts

  #sessions
  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  get '/cart', to:'orderproducts#index', as: 'cart'

  # Products:
  root 'products#root', as: 'homepage'
  resources :products do
    # add orderproducts (cart#index)
    # resources :reviews, only: [:new]
    # resources :merchants, only: [:index]
    resources :categories, only: [:index]
  end

  # Merchants:
  resources :merchants do
    resources :products, only: [:index]
  end

  # Reviews:
  resources :reviews

  # Categories:
  resources :categories

  # Orders:
  resources :orders

end
