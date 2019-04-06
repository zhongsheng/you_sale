Rails.application.routes.draw do
  resources :imports
  resources :tags
  resources :suppliers
  resources :categories do
    resources :tags
  end
  resources :contries
  get 'utility/upload_token'
  root to: "home#index"
  devise_for :users,  controllers: { registrations: "registrations"}
  resources :products
end
