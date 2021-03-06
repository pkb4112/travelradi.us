# Travel Radi.us
## www.TravelRadi.us (https://vast-meadow-10045.herokuapp.com/)

A personal project by Peter Brandon to explore interacting with a third-party API. Travel Radius allows the user to enter an origin location, and various destination locations for which they would like to find out the distance and approximate driving time to.  For example, you might be moving to a new apartment (the origin) and want to know what your commute will be to work, the gym, the supermarket, etc. (the destinations)

The app makes use of the Google Maps Distance Matrix API through means of the ['google_maps_service'](https://github.com/edwardsamuel/google-maps-services-ruby) gem by [EdwardSamuel](https://github.com/edwardsamuel) 

## Using TravelRadi.us

1. Visit www.TravelRadi.us (or alternate (https://vast-meadow-10045.herokuapp.com/)
2. Enter an origin location and click "Set Origin Location"
3. Enter a destination location and click "Add Destination"

## Future Improvements

 - Sharing - Generate a share url that will automatically load the origin/destinations for the receiving user.

 - Front End - Make it look nicer. 

 - Map Embed - Add an interactive map to show markers/routes between locations. 

 - Comparison - Comparison of driving distance/time between multiple origin points for the same set of destinations. 

 - Robustness - Protect against unknown/erroneous location input. 


### Prerequisites

If running locally, you'll likely need to have postgresql installed. Though the application doesn't currently make use of postgresql, it's configured as such to leave room for future improvements.

## Authors

* **Peter Brandon** - [pkb4112](https://github.com/pkb4112)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


