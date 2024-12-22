class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Product.pluck(:category).uniq
  end
end
