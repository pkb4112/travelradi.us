class DestinationsController < ApplicationController

	#Should add before_create to verify destination is valid through google 
    




	def create
		flash[:success] = "Destination Added"
		session[:destinations] ||= Hash.new
		current_id = get_id 
		session[:destinations][current_id] = Hash.new
		session[:destinations][current_id][:address] = location_params[:address]
		redirect_to root_url
	end

	def destroy 
		id = location_params[:id]
		session[:destinations].delete(id)
		redirect_to root_url
	end

	private 

	  def get_id 
	  	index = session[:destinations].length - 1 
	  	current_id = session[:destinations].keys[index].to_i + 1
	  end

	  def location_params
	  	params.permit(:address, :id)
	  end
end