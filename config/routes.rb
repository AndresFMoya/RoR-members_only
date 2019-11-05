Rails.application.routes.draw do

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"
  resources :users
  root 'sessions#new'
  resources :posts,     only: [:new, :create, :index]
end
