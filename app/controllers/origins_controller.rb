class OriginsController < ApplicationController

	def create
		flash[:success] = "Origin Added"
		session[:origin] = [] 
		session[:origin][0] = location_params[:origin]
		redirect_to root_url
	end

	def destroy
	session[:origin] = nil 
	redirect_to root_url
	end

	private
	def location_params 
	  params.permit(:origin)
	end
end
