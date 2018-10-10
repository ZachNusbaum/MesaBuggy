class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit]

  def show
  end

  def edit
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
