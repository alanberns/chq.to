Rails.application.routes.draw do
  get 'links/type' => "links#type"
  resources :links
  resources :users, only: [:new, :create, :destroy]

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"

  get "l/:slug" => "links#slug", as: "public_link"
  post "l/:slug" => "links#post_slug", as: "slugPass"

  get "links/:id/statistics/detail" => "statistics#show_detail", as: "show_detail_stats"
  get "links/:id/statistics/day" => "statistics#show_day", as: "show_day_stats"

  get '/404', to: 'errors#not_found'
  get '/403', to: 'errors#forbidden'
  get '/500', to: 'errors#internal_server_error'

  match '*unmatched', to: 'errors#not_found', via: :all

  get "up" => "rails/health#show", as: :rails_health_check

  
  root to: "home#index"
end