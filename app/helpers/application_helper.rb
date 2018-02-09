module ApplicationHelper

  #Pulls destination addresses from the destinations hash and returns them in an array.
  def extract_addresses(destinations)
      destination_list = []
      destinations.each_value do |destination|
        destination_list << destination["address"]
      end
      return destination_list 
  end

  def origin_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=570x600&zoom=13&key=#{ENV["STATIC_MAPS_API_KEY"]}"
  end

  def static_map(destinations)
  	addresses = extract_addresses(destinations)
  	destination_list = addresses.join("%7C")
  "https://maps.googleapis.com/maps/api/staticmap?size=570x600&markers=color:red%7C#{destination_list}%7C&key=#{ENV["STATIC_MAPS_API_KEY"]}"
  end

end
