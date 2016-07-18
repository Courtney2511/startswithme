Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users, only: [:new, :create]

  resources :texts do
    resources :comments, only: [:show, :create, :destroy]
  end

  resources :videos do
    resources :comments, only: [:show, :create, :destroy]
  end

  resources :photos do
    resources :comments, only: [:show, :create, :destroy]
  end

end
