class StaticPagesController < ApplicationController
	include StaticPagesHelper

  def home
  	@travel_time ||= Hash.new
    @origin = session[:origin][0] if origin_set?
    @destinations = session[:destinations] if destinations_set?
    
  	if origin_set? && destinations_set?
  	  address_list = extract_addresses(@destinations)
      @matrix = generate_distance_matrix(@origin,address_list,'driving','imperial')
      @destinations.length.times do |x|
  	  	  row_val = x
  	  	  distance = @matrix[:rows][0][:elements][row_val][:distance][:text]
  	  	  travel_time = @matrix[:rows][0][:elements][row_val][:duration][:text]
  	      @destinations.values[x][:distance] = distance 
  	      @destinations.values[x][:time] = travel_time   
  	  end
    end
  end

  private

  def generate_distance_matrix(origin,address_list,mode,units)
  	gmaps ||= initialize_maps
  	gmaps.distance_matrix(origin, address_list, mode: mode, units: units)
  end

  def extract_addresses(destinations)
  	  destination_list = []
  	  destinations.each_value do |destination|
  	  	destination_list << destination["address"]
  	  end
  	  return destination_list 
  end

  def initialize_maps
     GoogleMapsService::Client.new
  end

  def location_params
  	params.permit(:origin,:destination)
  end


end
