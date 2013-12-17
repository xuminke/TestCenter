class FactorController < ApplicationController
  layout 'home_index'

  def new
  	@factor = Factor.new()
    @factor.test_file_id = params[:test_file_id]
  end

  def create
  	@factor = Factor.new(params[:factor])
   #  @factor.test_file_id=params[:test_file_id]
    @factor.factor_name = params[:factor_divistor_name]
    @factor.test_file_id = params[:test_file_or_factor]
  	@factor.save
  	redirect_to :controller=>"test_file", :action=>"show", :id=>"#{@factor.test_file_id}"
  end

  def destroy
    factor = Factor.find(params[:id])
    factor.destroy
    redirect_to :back
  end

  def get_info
    p params[:id]
    divisors = Divisor.where("factor_id=?",params[:id])
    @rsc={ 
      :divisors=>divisors
    }
    render :json=>@rsc

  end

end