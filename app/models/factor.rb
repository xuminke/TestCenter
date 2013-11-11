class Factor < ActiveRecord::Base
  attr_accessible :factor_name
  has_many :divisors
  belongs_to :test_file
end
