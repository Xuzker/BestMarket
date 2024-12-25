Rails.application.routes.draw do
  # Главная страница
  root "home#index"

   # Профиль пользователя
  resource :profile, only: [:show, :edit, :update], controller: 'users' do
    get 'edit', to: 'users#edit', as: 'edit_profile'
    patch 'update', to: 'users#update', as: 'update_profile'
  end

  # Ресурсы для продуктов
  resources :products, only: [:index, :show, :create, :update, :destroy] do
    post 'add_to_cart', to: 'cart#add', as: 'add_to_cart' # Добавление товара в корзину
  end

  # Корзина
  resource :cart, only: [:show], controller: 'cart' do
    resources :cart_items, only: [:destroy, :update], shallow: true # Для удаления товара из корзины
  end

  # Оформление заказа
  resource :cart, only: [:show], controller: 'cart' do
    post 'checkout', to: 'cart#checkout', as: 'checkout'
  end
  resources :orders, only: [:index, :show]
  # Поиск
  get "/search", to: "search#search" # Поиск товаров

  # Настройка маршрутов для Devise
  devise_for :users, controllers: { passwords: 'users/passwords' }

  # Админ панель
  get '/admin', to: 'admin#index', as: 'admin'
end
