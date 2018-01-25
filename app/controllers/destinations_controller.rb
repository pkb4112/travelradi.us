class DestinationsController < ApplicationController

	def create
		flash[:success] = "Destinations Added"
		session[:destinations] ||= Hash.new
		current_ID = session[:destinations].length + 1
		session[:destinations][current_ID] = Hash.new
		session[:destinations][current_ID][:address] = location_params[:address]
		redirect_to root_url
	end

	def destroy 
		id = location_params[:id]
		session[:destinations].delete(id)
		redirect_to root_url
	end

	private 
	  def location_params
	  	params.permit(:address, :id)
	  end
end