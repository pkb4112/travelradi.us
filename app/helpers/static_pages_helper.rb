module StaticPagesHelper
	def origin_set?
 	  !session[:origin].nil?
  end


  #Desperately in need of refactor. Temporary solution
  def destinations_set?
  	if session[:destinations].nil?
  		return false
  	elsif session[:destinations].length < 1
  		return false 
  	else
  		return true 
  	end
  end

end
