Rails.application.routes.draw do
  resources :trips
  resources :books
  resources :genres
  resources :publishers
  resources :authors
  get 'home/index'
  get 'books/retrieve_from_google/:isbn' => 'books#retrieve_book_from_google'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
end