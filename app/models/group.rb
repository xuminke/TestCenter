class Group < ActiveRecord::Base
  attr_accessible :group_name
  has_many :projects
end
