class DivisorController < ApplicationController
	layout "home_index"

	#添加测试文件的方法
	def index
	end
	def new
		@divisor = Divisor.new
		@divisor.factor_id= params[:factor_id]
	end

	def create
    @divisor = Divisor.new()
    @divisor.divisor_name = params[:factor_divistor_name]
    @divisor.factor_id = params[:test_file_or_factor]
		@divisor.save
		# factor = Factor.find(params[:factor_id])
		redirect_to :back
	end

	def destroy
    arr = params[:divisor_arr]
    arr_1 = arr.split(",")
    p arr_1
    arr_1.each do |i|
      divisor=nil
      divisor = Divisor.find(i.to_i)
      divisor.destroy
    end
    redirect_to :back
	end
end