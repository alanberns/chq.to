Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  # get "logout" => "sessions#destroy", as: "logout"

  get "up" => "rails/health#show", as: :rails_health_check

  
  # root "posts#index"
end