class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter  :get_group
  helper :all


  # def get_version
  #   @versions = {}
  #   items = Version.find(:all)
  #   items.each do |obj|
  #     if(@versions[obj.work_year])
  #       @versions[obj.work_year] << obj.identifer
  #     else
  #       @versions[obj.work_year] = [obj.identifer]
  #     end
  #   end
  # end

  def get_group
    @groups_all = Group.find(:all)
  end
end
