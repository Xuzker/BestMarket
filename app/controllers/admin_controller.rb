class AdminController < ApplicationController
    def index
      @categories = Product.pluck(:category).uniq
      @products = Product.all
  
      if params[:query].present?
        @products = @products.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
      end
  
      if params[:category].present?
        @products = @products.where(category: params[:category])
      end
  
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end