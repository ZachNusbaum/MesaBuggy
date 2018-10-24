class Reports::VisitsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin_user!
  def show
    @visit = Ahoy::Visit.find_by(visit_token: params[:id])
  end
end
