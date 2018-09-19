class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_admin_user!
    unless user_signed_in? && current_user.admin
      redirect_to root_url, notice: 'Sorry, you are not an admin.'
    end
  end
end
