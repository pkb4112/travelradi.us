class OriginsController < ApplicationController
     
    #Stores the origin in the session.
	def create
		flash[:success] = "Origin Added"
		session[:origin] = [] 
		session[:origin][0] = location_params[:origin]
		redirect_to root_url
	end

    #Deletes the origin from the session.
	def destroy
	session[:origin] = nil 
	redirect_to root_url
	end

	private
	def location_params 
	  params.permit(:origin)
	end
end
