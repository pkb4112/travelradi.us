module ApplicationHelper

  def static_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=570x600&zoom=13&key=#{ENV["STATIC_MAPS_API_KEY"]}"
  end

end
