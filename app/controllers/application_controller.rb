class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_search_query
  before_action :track_page_visit
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
