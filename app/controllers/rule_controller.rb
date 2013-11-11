class RuleController < ApplicationController
 
  #create case 
  def create
  	session[:test_file_id]= nil
  	test_file= TestFile.find(params[:test_file])
  	session[:test_file_id]=test_file.id
  	puts "*******************************************"
  	p session[:test_file_id]
  	factors= Factor.find_all_by_test_file_id(test_file.id)
  	factors_id=[]
  	factors.each do |f|
  		factors_id << f.id
  	end
  	factor_1=[]
  	factors_id.each do |f|
  		divisor_1=[]
  	  divisor_arr= Divisor.find_all_by_factor_id(f)
  	  divisor_arr.each do |divisor|
  	  	divisor_1 << divisor.id
  	  end
  	  factor_1 << divisor_1
  	end 
  	  str="factor_1[0]"
  	  (1..factor_1.length-1).each{|i|str+=".product(factor_1[#{i}])"}
  	  rule = eval(str)
  	  #rules= rule.each{ |item| item.flatten}
  	  rules=[]
  	  rule.each do |r|
        rules << r.flatten
  	  end
  	  #保存生成的case到case表中
  	  rules.each do |r|
  	  	str=nil
  	  	example=nil
        str= r.join(",")
        example=Example.new
        p str
        puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        example.content=str
        example.test_file_id= test_file.id
        example.save
  	  end
  	  @item= []
  	  rules.each do |r|
  	  	item= nil
        r.each do |j|
          item = Divisor.find_by_id(j) 
          @item << item
        end
  	  end
  	  redirect_to :controller=>"examples", :action=>"show"
  end
end