class AdminController < ApplicationController
    def index
      @categories = Product.pluck(:category).uniq
      @view_type = params[:view_type] || 'products'
      
      if @view_type == 'products'
        @products = Product.all
        if params[:query].present?
          @products = @products.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
        end
        if params[:category].present?
          @products = @products.where(category: params[:category])
        end
      else
        @orders = Order.includes(:order_items, :user).order(created_at: :desc)
      end
  
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end