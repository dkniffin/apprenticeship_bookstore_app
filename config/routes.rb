Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :books, only: [:show, :index]

  resources :orders, only: [:show, :index, :edit] do
    post "add_to_cart", to: 'orders#add_to_cart', on: :collection, as: :add_to_cart
    post "place", to: 'orders#place_order', on: :member
  end

  resources :line_items, only: [:update, :destroy]
end
