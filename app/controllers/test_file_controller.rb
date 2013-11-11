class TestFileController < ApplicationController

	#添加测试文件的方法
	def index
	  @test_file = TestFile.find(:all)
	end
	def new
		session[:project_id]=nil
		@test_file = TestFile.new
		session[:project_id]=params[:project_id]
	end

	def create
    @test_file = TestFile.new(params[:test_file])
    @test_file.project_id = session[:project_id]
		@test_file.save
		id = @test_file.id
		redirect_to :controller=>"project" ,:action=>"show", :id=>"#{session[:project_id]}"
	end

	#show test_file just now
	def show
		session[:file_id]= nil
		@test_file = TestFile.find(params[:id])
		session[:file_id]= @test_file.id
		@factor= Factor.find(:all, :conditions=>{:test_file_id=>"#{@test_file.id}"})
		puts @factor
	end
end