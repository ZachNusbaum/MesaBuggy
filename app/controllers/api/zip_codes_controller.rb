class Api::ZipCodesController < ApplicationController
  def lookup
    @zip = Postjoy.find(params[:code])
    if @zip
      render json: {success: true, result: @zip}
    else
      render json: {success: false, result: nil}
    end
  end
end
