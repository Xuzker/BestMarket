Rails.application.routes.draw do
  # Главная страница
  root "home#index"

  # Ресурсы для продуктов
  resources :products, only: [:index, :show, :create, :update, :destroy] do
    post 'add_to_cart', to: 'cart#add', as: 'add_to_cart' # Добавление товара в корзину
  end

  # Корзина
  resource :cart, only: [:show], controller: 'cart' do
    resources :cart_items, only: [:destroy, :update], shallow: true # Для удаления товара из корзины
  end

  # Оформление заказа
  get "/checkout", to: "checkout#index", as: "checkout" # Страница оформления заказа

  # Поиск
  get "/search", to: "search#search" # Поиск товаров

  # Профиль пользователя
  get "/profile", to: "users#show", as: "profile" # Страница профиля пользователя

  # Настройка маршрутов для Devise
  devise_for :users, controllers: { passwords: 'users/passwords' }

  # Админ панель
  get '/admin', to: 'admin#index', as: 'admin'
end
