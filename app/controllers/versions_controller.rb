class VersionsController < ActionController::Base
  layout "home_index"
  
  
  def index
    # @versions = {}
    # items = Version.find(:all)
    # items.each do |obj|
    #   if(@versions[obj.work_year])
    #     @versions[obj.work_year] << obj.identifer
    #   else
    #     @versions[obj.work_year] = [obj.identifer]
    #   end
    # end
    @versions = Version.find(:all)
    @groups_all = Group.find(:all)
    p @versions
    p "***************************************"
  end

  def new
    @groups_all = Group.find(:all)
    @version = Version.new();
  end

  def create
    version = Version.new(params[:version])
    version.save
    redirect_to :action=>"new"
  end
end