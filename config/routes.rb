Rails.application.routes.draw do
  get "login", to: "session#new", as: "login"
  post "session/new", to: "session#create", as: "login_create"
  post "logout", to: "session#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "user#index"
  resources :todos
  resources :user
end
