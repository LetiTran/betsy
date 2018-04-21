Rails.application.routes.draw do

  #sessions
  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'
  # Reviews:
  #
  # Products:
  root 'products#root', as: 'homepage'
#resources :reviews
  resources :products do
    # add orderproducts (cart#index)
    resources :reviews,only: [:new,:create]
    #resources :merchants, only: [:index]
    #resources :categories, only: [:index]
  end

  # Merchants:
  resources :merchants do
    resources :products, only: [:index]
  end


  resources :reviews,only: [:new,:create]

  # Categories:
  resources :categories

  # Orders:
  resources :orders

end
