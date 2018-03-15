class StaticPagesController < ApplicationController
	include StaticPagesHelper

  def home
    @origin = get_origin #StaticPagesHelper
    @destinations = get_destinations #StaticPagesHelper
    
  	if origin_set? && destinations_set? #StaticPagesHelper
  	  address_list = extract_addresses(@destinations)
      begin 
        @matrix = generate_distance_matrix(@origin,address_list,'driving','imperial')
        @destinations.length.times do |x|
    	  	  row_val = x
    	  	  distance = @matrix[:rows][0][:elements][row_val][:distance][:text]
    	  	  travel_time = @matrix[:rows][0][:elements][row_val][:duration][:text]
    	      @destinations.values[x][:distance] = distance 
    	      @destinations.values[x][:time] = travel_time   
    	  end
      rescue 
        flash[:danger]="Location Not Found"
      end
    end
  end

  private
  
   #Submits request to Google Maps Distance Matrix API using 'google_maps_service' gem
  def generate_distance_matrix(origin,address_list,mode,units)
  	gmaps ||= initialize_maps
  	gmaps.distance_matrix(origin, address_list, mode: mode, units: units)
  end


  
  #Initialize gmaps client
  def initialize_maps
     GoogleMapsService::Client.new
  end

  #Strong params
  def location_params
  	params.permit(:origin,:destination)
  end


end
