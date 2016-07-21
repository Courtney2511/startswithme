Rails.application.routes.draw do

  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :users
  # , only: [:new, :create]

  resources :posts do
    resources :photos, only: [:show, :create, :destroy]
    resources :comments, only: [:show, :create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

end
