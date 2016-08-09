Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/privacy'

  get 'static_pages/terms'

  get 'static_pages/links'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users, only: [:new, :show, :create, :update, :edit]

  resources :posts do
    resources :photos, only: [:show, :create, :destroy]
    resources :comments, only: [:show, :create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

end
