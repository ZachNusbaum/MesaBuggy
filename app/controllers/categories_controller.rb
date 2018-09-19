class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_category

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
