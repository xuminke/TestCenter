class AttachmentsController < ApplicationController
  
  def upload
    ff = params[:attachment].original_filename
    pro_id = params[:project_id]
    @attachment = Attachment.new
    @attachment.file_name = ff
    @attachment.file_url = params[:attachment].read
    @attachment.project_id = pro_id 
    @attachment.save
    redirect_to :back

  end
end