class SearchController < ApplicationController
    def search
      @original_query = params[:query] || ""
      @category = params[:category] || ""
      @categories = Product.pluck(:category).uniq

      if params[:query].present?
        query = "%#{@original_query.strip.downcase}%"
        @products = Product.where("LOWER(name) LIKE ?", query)
        
        if params[:category].present?
          @products = @products.where(category: params[:category])
        end
      

      elsif params[:category].present?
        @products = Product.where(category: params[:category])
      else
        @products = []
      end
      render :search
    end
  end