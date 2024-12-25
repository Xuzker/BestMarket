class CartItemsController < ApplicationController
  before_action :authenticate_user!

  # Уменьшение количества товара
  def update
    @cart_item = current_user.cart_items.find(params[:id])

    # Уменьшаем количество на 1, если количество больше 1
    if @cart_item.quantity > 1
      @cart_item.update(quantity: @cart_item.quantity - 1)
      notice_message = 'Количество товара уменьшено на 1.'
    else
      notice_message = 'Количество товара не может быть меньше 1.'
    end

    redirect_to cart_path, notice: notice_message
  end

  # Удаление товара из корзины
  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy

    redirect_to cart_path, notice: 'Товар удален из корзины.'
  end
end
