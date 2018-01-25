module StaticPagesHelper

	#Checks for an origin in the session.
	def origin_set?
 	  !session[:origin].nil?
  end

  def get_origin
  	return session[:origin][0] if origin_set?
  	nil
  end


 #Checks for any destinations in the session. 
  def destinations_set?
  	if !session[:destinations].nil? && session[:destinations].first 
  		return true
  	else
  		return false
  	end
  end

  def get_destinations
  	return session[:destinations] if destinations_set?
  	nil
  end

end
