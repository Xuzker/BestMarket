class SearchController < ApplicationController
    def search
      if params[:query].present?
        @original_query = params[:query]
        query = "%#{@original_query.strip.downcase}%"
        @products = Product.where("LOWER(name) LIKE ?", query)
      else
        @products = []
      end
      render :search
    end
  end