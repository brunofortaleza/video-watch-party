Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users, only: :create
  resources :comments, only: :create

  resources :rooms do
    resources :messages
  end
end
