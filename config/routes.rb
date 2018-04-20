Rails.application.routes.draw do

  # Products:
  get 'products/root', to: 'products#root', as: 'root'

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  # Merchants:
  get 'merchants/index'

  get 'merchants/show'

  get 'merchants/new'

  get 'merchants/create'

  get 'merchants/edit'

  get 'merchants/update'

  get 'merchants/destroy'

  # Sessions:
  get 'sessions/index'

  get 'sessions/show'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # Reviews:
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/update'

  get 'reviews/edit'

  get 'reviews/destroy'

  # Categories:
  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'

  get 'categories/update'

  get 'categories/edit'

  get 'categories/destroy'

  # Orders:
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/update'

  get 'orders/edit'

  get 'orders/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
