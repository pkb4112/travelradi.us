
  # Setup global parameters
GoogleMapsService.configure do |config|
  config.key = ENV['DISTANCE_MATRIX_API_KEY']
  config.retry_timeout = 20
  config.queries_per_second = 10
end

# Initialize client using global parameters
gmaps = GoogleMapsService::Client.new
