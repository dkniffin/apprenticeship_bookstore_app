Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :books, only: [:show, :index]

  resources :orders, only: [:show, :index, :edit] do
    collection do
      post "add_to_cart", to: 'orders#add_to_cart', as: :add_to_cart
    end
    member do
      post "place", to: 'orders#place_order'
      post "confirm", to: 'orders#confirm_order'
    end
  end

  resources :line_items, only: [:update, :destroy]
end
