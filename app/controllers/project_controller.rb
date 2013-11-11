class ProjectController < ApplicationController
  
  #index page
	def index
	  @project = Project.find(:all)
	end
  
  #add new method
  def new
		@project = Project.new
	end

	def create
    @project = Project.new(params[:project])
		@project.save
		id = @project.id
		redirect_to :action=>"index"
	end

	def show
		session[:project_id]= nil
		@project = Project.find(params[:id])
		session[:project_id]= @project.id
		@test_file= TestFile.find(:all, :conditions=>{:project_id=>"#{@project.id}"})
		puts @test_file
	end
end