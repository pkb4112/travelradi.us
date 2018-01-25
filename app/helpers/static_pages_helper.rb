module StaticPagesHelper
	def origin_set?
 	  !session[:origin].nil?
  end


  
  def destinations_set?
  	if !session[:destinations].nil? && session[:destinations].first 
  		return true
  	else
  		return false
  	end
  end

end
