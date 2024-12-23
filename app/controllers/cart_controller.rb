class CartController < ApplicationController
  before_action :authenticate_user!

  # Отображение корзины
  def show
    @cart_items = current_user.cart_items
    @total_price = @cart_items.sum { |item| item.product.price * item.quantity }
  end

  # Добавление товара в корзину
  def add
    product = Product.find(params[:product_id])
    cart_item = current_user.cart_items.find_or_initialize_by(product: product)

    if cart_item.new_record?
      cart_item.quantity = 1
    else
      cart_item.quantity += 1
    end

    return redirect_to products_path, alert: 'Не удалось добавить товар в корзину.' unless  cart_item.save

    redirect_to cart_path
  end

  # Удаление товара из корзины
  def destroy
    cart_item = current_user.cart_items.find(params[:id])

    if cart_item.destroy
      respond_to do |format|
        format.html { redirect_to cart_path, notice: 'Товар удалён из корзины.' }
        format.turbo_stream
      end
    else
      redirect_to cart_path, alert: 'Не удалось удалить товар из корзины.'
    end
  end
end
