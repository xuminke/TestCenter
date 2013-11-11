class FactorController < ApplicationController
  def test
  end

  def new
  	@factor = Factor.new()
  end

  def create
  	@factor = Factor.new(params[:factor])
    @factor.test_file_id=session[:file_id]
  	@factor.save
    session[:file_id]= nil
  	redirect_to :action=>"test"
  end
end