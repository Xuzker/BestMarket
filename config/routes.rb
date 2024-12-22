Rails.application.routes.draw do
  # Главная страница
  root "home#index"

  # Ресурсы для продуктов
  resources :products, only: [:index, :show] do
    post 'add_to_cart', to: 'cart#add', as: 'add_to_cart' # Маршрут для добавления товара в корзину
  end
  
  get "/search", to: "search#search" # Маршрут для отображения поиска товаров

  # Корзина
  get "/cart", to: "cart#index" # Маршрут для отображения корзины
  resources :cart_items, only: [:destroy] # Маршрут для удаления товара из корзины

  # Профиль пользователя
  get "/profile", to: "users#show" # Маршрут для отображения профиля пользователя

  # Настройка маршрутов для Devise с использованием кастомного контроллера для паролей
  devise_for :users, controllers: { passwords: 'users/passwords' }
end
