class TestFile < ActiveRecord::Base
  attr_accessible :test_file_name
  has_many :factors
  has_many :rules
  belongs_to :test_file
end
