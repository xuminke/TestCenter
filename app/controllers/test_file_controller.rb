class TestFileController < ApplicationController
	layout 'home_index'

	#添加测试文件的方法
	def index
	  @test_file = TestFile.find(:all)
	end
	def new
		project_id = params[:project_id]
		@test_file_new = TestFile.new
		@test_file.project_id = project_id
	end

	def create
    @test_file = TestFile.new()
    @test_file.test_file_name = params[:test_file_name]
    @test_file.project_id = params[:project_id]
		@test_file.save
		project = Project.find(params[:project_id])
		if(project.test_file_id.blank?)
			project.test_file_id = (@test_file.id).to_s
		
	  else
      project.test_file_id +=(","+(@test_file.id).to_s)
	  end
		
		project.save
		id = @test_file.id
		redirect_to :controller=>"project" ,:action=>"show", :id=>@test_file.project_id
	end

	#show test_file just now
	def show
		@test_file = TestFile.find(params[:id])
		project = Project.find_by_id(@test_file.project_id)
		@project_name = project.project_name;
    @project_id = project.id
		@factor= Factor.find(:all, :conditions=>{:test_file_id=>"#{@test_file.id}"})
	end

	def destroy
    test_file = TestFile.find(params[:id])
    test_file.destroy
    redirect_to :back
	end

	def edit_test_file
    test_file = TestFile.find_by_id(params[:id])
    test_file.test_file_name = params[:test_file_name]
    test_file.save
    redirect_to :back
	end

	def get_info
    @rsc = TestFile.find(params[:id])
    render :json=>{
      :test_file_name => @rsc.test_file_name,     
    }
  end
end