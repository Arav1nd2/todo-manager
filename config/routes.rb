Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "user/login", to: "user#login"

  resources :todos
  resources :user
end
