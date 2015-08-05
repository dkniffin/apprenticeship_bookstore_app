Rails.application.routes.draw do

  resources :line_items
  resources :orders
  root to: 'books#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :books, only: [:show,:index]
end
