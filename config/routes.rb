Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD

  resources :orderproducts

=======
root 'products#root', as: 'homepage'
>>>>>>> product_controller
=======



  resources :orderproducts





root 'products#root', as: 'homepage'


>>>>>>> testing
  #sessions
  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'
<<<<<<< HEAD
<<<<<<< HEAD

  get '/cart', to:'orderproducts#index', as: 'cart'

=======
  # Reviews:
  #
>>>>>>> product_controller
=======


  get '/cart', to:'orderproducts#index', as: 'cart'


  # Reviews:
  #
>>>>>>> testing
  # Products:
resources :products
  resources :products do
    # add orderproducts (cart#index)
<<<<<<< HEAD
<<<<<<< HEAD
    # resources :reviews, only: [:new]
    # resources :merchants, only: [:index]
    resources :categories, only: [:index]
=======
    resources :reviews,only: [:new,:create]
    #resources :merchants, only: [:index]
    #resources :categories, only: [:index]
>>>>>>> product_controller
=======


     resources :reviews, only: [:new]
    # resources :merchants, only: [:index]
    resources :categories, only: [:index]


    resources :orderproducts

      resources :reviews,only: [:new,:create]
    #resources :merchants, only: [:index]
    #resources :categories, only: [:index]

>>>>>>> testing
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
