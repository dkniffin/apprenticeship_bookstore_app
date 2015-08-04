Rails.application.routes.draw do
  root to: "books#index"

  devise_for :users
  resources :users, only: [:index, :update, :edit]

  resources :books
end
