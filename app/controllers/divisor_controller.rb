class DivisorController < ApplicationController

	#添加测试文件的方法
	def index
	end
	def new
		session[:factor_id]= nil
		@divisor = Divisor.new
		session[:factor_id]= params[:factor_id]
	end

	def create
    @divisor = Divisor.new(params[:divisor])
    @divisor.factor_id= session[:factor_id]
		@divisor.save
		session[:factor_id]=nil
		redirect_to :action=>"index"
	end
end