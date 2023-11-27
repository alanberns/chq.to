Rails.application.routes.draw do
  resources :links
  resources :users, only: [:new, :create, :destroy]

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"

  get "l/:slug" => "links#slug" 

  get "up" => "rails/health#show", as: :rails_health_check

  
  root to: "links#index"
end