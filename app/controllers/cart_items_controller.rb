class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart_item = current_user.cart_items.find(params[:id])

    if @cart_item.quantity > 1
      @cart_item.update(quantity: @cart_item.quantity - 1)
      notice_message = 'Количество товара уменьшено на 1.'
    else
      @cart_item.destroy
      notice_message = 'Товар удален из корзины.'
    end

    return redirect_to cart_path, alert: notice_message unless @cart_item.save

    redirect_to cart_path
  end

end
