class Api::ZipCodesController < ApplicationController
  skip_before_action :authenticate_user!
  def lookup
    @zip = Postjoy.find(params[:code].split('-')[0])
    if @zip
      render json: {success: true, input: params[:code], result: @zip}
    else
      render json: {success: false, input: params[:code], result: nil}
    end
    response.set_header('X-Mesa-Buggy-API-UID', SecureRandom.uuid)
    response.set_header('Access-Control-Allow-Origin', '*')
    request.set_header('Access-Control-Request-Method', %w{GET POST OPTIONS}.join(","))
  end
end
