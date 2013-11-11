class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :test_file_id
  has_many :test_files
end
