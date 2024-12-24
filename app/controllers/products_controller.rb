class ProductsController < ApplicationController
    def new
      @product = Product.new
      @categories = Product.pluck(:category).uniq
    end
  
    def create
      @product = Product.new(product_params)

      if params[:new_category].present?
        @product.category = params[:new_category]
      end
  
      if @product.save
        respond_to do |format|
          format.html { redirect_to admin_path, notice: 'The product has been created successfully.' }
          format.js
        end
      else
        @categories = Product.pluck(:category).uniq
        respond_to do |format|
          format.html { redirect_to admin_path, notice: 'Product was not created' }
          format.js 
        end
      end
    end
  
    def update
      @product = Product.find(params[:id])
      
      if @product.update(product_params)
        respond_to do |format|
          format.json { render json: { success: true } }
        end
      else
        respond_to do |format|
          format.json { render json: { success: false, errors: @product.errors.full_messages } }
        end
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      
      if @product.destroy
        respond_to do |format|
          format.json { render json: { success: true } }
        end
      else
        respond_to do |format|
          format.json { render json: { success: false, errors: @product.errors.full_messages } }
        end
      end
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :image_url, :category)
    end
  end