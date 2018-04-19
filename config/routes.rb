Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/update'

  get 'orders/edit'

  get 'orders/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
