Rails.application.routes.draw do

  # Products:
  root 'products#root', as: 'homepage'

  resources :products do
    resouces :reviews, only: [:new]
  end

  # get 'products/index'
  #
  # get 'products/:id', to: 'products#show', as: 'product'
  #
  # get 'products/new'
  #
  # get 'products/create'
  #
  # get 'products/edit'
  #
  # get 'products/update'
  #
  # get 'products/destroy'

  # Merchants:
  resources :merchants
  # get 'merchants/index'
  #
  # get 'merchants/show'
  #
  # get 'merchants/new'
  #
  # get 'merchants/create'
  #
  # get 'merchants/edit'
  #
  # get 'merchants/update'
  #
  # get 'merchants/destroy'

  # Sessions:
  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:index, :show]
  # get 'sessions/index'
  #
  # get 'sessions/show'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # Reviews:
  resources :reviews
  # get 'reviews/index'
  #
  # get 'reviews/show'
  #
  # get 'reviews/new'
  #
  # get 'reviews/create'
  #
  # get 'reviews/update'
  #
  # get 'reviews/edit'
  #
  # get 'reviews/destroy'

  # Categories:
  resources :categories
  # get 'categories/index'
  #
  # get 'categories/show'
  #
  # get 'categories/new'
  #
  # get 'categories/create'
  #
  # get 'categories/update'
  #
  # get 'categories/edit'
  #
  # get 'categories/destroy'

  # Orders:
  resources :orders
  # get 'orders/index'
  #
  # get 'orders/show'
  #
  # get 'orders/new'
  #
  # get 'orders/create'
  #
  # get 'orders/update'
  #
  # get 'orders/edit'
  #
  # get 'orders/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
