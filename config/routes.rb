Rails.application.routes.draw do
  root "/home", to: 'static_pages/home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :posts
end
