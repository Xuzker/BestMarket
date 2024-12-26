class UsersController < ApplicationController
  before_action :authenticate_user!

  # Отображение профиля пользователя
  def show
    @user = current_user
    @orders = @user.orders.includes(:order_items) # Получаем заказы пользователя
  end

  # Форма редактирования профиля
  def edit
    @user = current_user
  end

  # Обновление данных профиля
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Данные профиля успешно обновлены.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :address)
  end
end
