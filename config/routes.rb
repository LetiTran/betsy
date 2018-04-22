Rails.application.routes.draw do
<<<<<<< HEAD

  resources :orderproducts

=======
root 'products#root', as: 'homepage'
>>>>>>> product_controller
  #sessions
  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'
  # Reviews:
  #
  # Products:
resources :products
  resources :products do
    # add orderproducts (cart#index)
    resources :reviews,only: [:new,:create]
    #resources :merchants, only: [:index]
    #resources :categories, only: [:index]
  end
resources :reviews
  # Merchants:
  resources :merchants do
    resources :products, only: [:index]
  end

  # Categories:
  resources :categories

  # Orders:
  resources :orders

end
