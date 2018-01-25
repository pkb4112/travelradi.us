class StaticPagesController < ApplicationController
	include StaticPagesHelper

  def home
  	gmaps ||= initialize_maps
  	@travel_time ||= Hash.new
    @origin = session[:origin][0] if origin_set?
    @destinations = session[:destinations] if destinations_set?
    
  	if origin_set? && destinations_set?
  	  address_list = extract_addresses(@destinations)

  	  @matrix = gmaps.distance_matrix(@origin, address_list, mode: 'driving', units: "imperial")

  	  @destinations.each do |id, value|
  	  	  row_val = id.to_i - 1
  	  	  distance = @matrix[:rows][0][:elements][row_val][:distance][:text]
  	  	  travel_time = @matrix[:rows][0][:elements][row_val][:duration][:text]
  	      @destinations[id][:distance] = distance 
  	      @destinations[id][:time] = travel_time   
  	  end
    end

  end

  private

  def extract_addresses(destinations)
  	  destination_list = []
  	  destinations.each_value do |destination|
  	  	destination_list << destination["address"]
  	  end
  	  return destination_list 
  end

  def initialize_maps
  	# Initialize client using global parameters
     GoogleMapsService::Client.new
  end

  def location_params
  	params.permit(:origin,:destination)
  end


end
