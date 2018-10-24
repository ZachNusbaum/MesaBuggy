class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_search_query
  before_action :track_page_visit

  def authenticate_admin_user!
    unless user_signed_in? && current_user.admin
      redirect_to root_url, notice: 'Sorry, you are not an admin.'
    end
  end

  def set_search_query
    @q = Product.ransack(params[:q])
  end

  def track_page_visit
    ahoy.track "Access Route", request.path_parameters
  end
end
