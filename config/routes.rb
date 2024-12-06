Rails.application.routes.draw do
  # Главная страница
  root "home#index"

  resources :products, only: [:index, :show]
  get "/cart", to: "cart#index"
  get "/profile", to: "users#show"
  devise_for :users
end
