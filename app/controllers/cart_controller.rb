class CartController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items
  end

  def add
    product = Product.find(params[:product_id])
    cart_item = current_user.cart_items.find_or_initialize_by(product: product)

    if cart_item.new_record?
      cart_item.quantity = 1
    else
      cart_item.quantity += 1
    end

    if cart_item.save
      redirect_to cart_path, notice: 'Товар добавлен в корзину.'
    else
      redirect_to products_path, alert: 'Не удалось добавить товар в корзину.'
    end
  end

  def destroy

  end
end
