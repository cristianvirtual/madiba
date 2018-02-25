Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # authenticated :user do
  #   root 'home#index', as: 'authenticated_root'
  # end
  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end

  resources :books, param: :code do
    resources :trips
  end
  resources :genres
  resources :publishers
  resources :authors


end