Rails.application.routes.draw do

  get 'static_pages/home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  root 'sessions#new'
  resources :posts
end
