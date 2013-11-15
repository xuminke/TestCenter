class GroupsController < ApplicationController
  layout "home_index" 
  
  # def index
  #   @group = Group.find(:all)
  # end

  def new
    @group = Group.new()
  end

  def create
    group = Group.new(params[:group])
    group.save
    redirect_to :action=>"index"
  end
end