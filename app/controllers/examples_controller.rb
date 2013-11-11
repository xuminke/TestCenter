class ExamplesController < ApplicationController
  def show
    test_file_id=session[:test_file_id]
    @example = Example.find_all_by_test_file_id(test_file_id)
    test_file = TestFile.find_by_id(test_file_id)  
    arr = test_file.factors
    factor = []
    divisor = []
    @arr= {}
    arr.each do |arr|
      factor << Factor.find_by_id(arr.id)
    end
    factor.each do |factor|
      (Divisor.find_all_by_factor_id(factor.id)).each do |d|
        divisor << d
      end
    end
    # To -> Hash
    divisor.each do |d|
      @arr["#{d.id}"] = "#{d.divisor_name}"
    end
    p @arr
    p "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"



  end
end