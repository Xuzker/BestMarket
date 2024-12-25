class CartController < ApplicationController
  before_action :authenticate_user!

  # Отображение корзины
  def show
    @cart_items = current_user.cart_items
    @total_price = @cart_items.sum { |item| item.product.price * item.quantity }
    @user = current_user
  end

  def checkout
    @order = Order.new(date: Time.current, user: current_user, address: params[:address])

    if @order.save
      current_user.cart_items.each do |cart_item|
        @order.order_items.create(
          product: cart_item.product,
          price: cart_item.product.price,
          quantity: cart_item.quantity
        )
      end
      current_user.cart_items.destroy_all # Очистка корзины после оформления заказа
      redirect_to orders_path, notice: 'Заказ успешно оформлен.'
    else
      redirect_to cart_path, alert: 'Не удалось оформить заказ. Заполните все поля в профиле!'
    end
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


    return redirect_to cart_path, alert: 'Не удалось удалить товар из корзины.' unless  cart_item.save

    redirect_to cart_path


  end
end
