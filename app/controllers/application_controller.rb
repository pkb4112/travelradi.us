class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'google_maps_service'


end
