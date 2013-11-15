class TestFile < ActiveRecord::Base
  attr_accessible :test_file_name
  has_many :factors , :foreign_key=>"test_file_id", :dependent=>:destroy
  has_many :rules, :foreign_key=>"test_file_id", :dependent=>:destroy
  has_many :examples, :foreign_key=>"test_file_id", :dependent=>:destroy
  belongs_to :test_file
end
