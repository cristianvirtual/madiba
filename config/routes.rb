Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
end