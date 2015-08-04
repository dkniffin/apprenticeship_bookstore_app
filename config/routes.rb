Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :books
end
