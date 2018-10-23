class SearchController < ApplicationController
  skip_before_action :set_search_query
  def new
    @q =  Product.ransack(params[:q])
  end

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).includes(:category)
  end
end
