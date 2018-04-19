Rails.application.routes.draw do

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/update'

  get 'reviews/edit'

  get 'reviews/destroy'

  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'

  get 'categories/update'

  get 'categories/edit'

  get 'categories/destroy'

  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/update'

  get 'orders/edit'

  get 'orders/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
