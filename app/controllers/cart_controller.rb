class CartController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items
  end
end
