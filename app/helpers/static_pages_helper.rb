module StaticPagesHelper
	def origin_set?
 	  !session[:origin].nil?
  end


  #Desperately in need of refactor. Temporary solution
  def destinations_set?
  	return true
  end

end
