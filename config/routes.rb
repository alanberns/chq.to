Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  
  # root "posts#index"
end