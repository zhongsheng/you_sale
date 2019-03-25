Rails.application.routes.draw do
  resources :categories
  resources :contries
  get 'utility/upload_token'
  root to: "home#index"
  devise_for :users
  resources :products
end