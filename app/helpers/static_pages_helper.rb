module StaticPagesHelper
	def origin_set?
 	  !!session[:origin]
  end

  def destinations_set?
  	session[:destinations].length >= 1
  end
end
