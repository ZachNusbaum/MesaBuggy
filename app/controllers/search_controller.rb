class SearchController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :set_search_query
  before_action :record_search, only: [:show]
  def new
    @q =  Product.ransack(params[:q])
  end

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).includes(:category)
  end

  private

  def record_search
    ahoy.track "Site search", request.path_parameters
  end
end
