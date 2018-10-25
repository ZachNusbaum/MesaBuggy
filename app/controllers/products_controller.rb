class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_admin_user!, only: [:edit, :update]

  def show
    @review = @product.reviews.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Update success.'
    else
      redirect_to edit_product_path(@product), notice: 'Error updating product.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description)
  end
end
