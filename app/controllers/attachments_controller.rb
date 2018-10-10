class AttachmentsController < ApplicationController
  def destroy
    @attachment = ActiveStorage::Attachment.find(params[:id])
    if @attachment
      @attachment.purge
      render json: { success: true, message: 'Attachment deleted.' }
    else
      render json: {success: false, message: 'Attachment ID is invalid.'}
    end
  end
end
