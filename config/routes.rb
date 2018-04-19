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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
