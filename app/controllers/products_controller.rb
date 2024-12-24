class ProductsController < ApplicationController
    def new
      @product = Product.new
      @categories = Product.pluck(:category).uniq
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        respond_to do |format|
          format.html { redirect_to admin_path, notice: 'The product has been created successfully.' }
          format.js
        end
      else
        @categories = Product.pluck(:category).uniq
        respond_to do |format|
          format.html { redirect_to admin_path, notice: 'Product not created' }
          format.js 
        end
      end
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :image_url, :category)
    end
  end