class AttachmentsController < ApplicationController
  
  def upload
    ff = params[:attachment].original_filename
    pro_id = params[:project_id]
    @attachment = Attachment.new
    @attachment.file_name = ff
    @attachment.file_url = params[:attachment].tempfile.read
    @attachment.project_id = pro_id 
    @attachment.save
    redirect_to :back
  end

  def download
    @attachment_file = Attachment.find(params[:attachment_id])
    send_data @attachment_file.file_url, :type=>'application/vnd.ms-excel; charset=utf-8', :filename=>@attachment_file.file_name, :disposition =>'attachment'
  end
end