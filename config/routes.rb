Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :password_resets

  resources :users
  # , only: [:new, :create]

  resources :posts do
    resources :photos, only: [:show, :create, :destroy]
    resources :comments, only: [:show, :create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

end
