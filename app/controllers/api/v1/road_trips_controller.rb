class Api::V1::RoadTripsController < ApplicationController

  def create
    # params = {"origin"=>"Breckenridge, CO", "destination"=>"Omaha, NE", "api_key"=>"t1h2i3s4_i5s6_l7e8g9i10t11"
      # input = body params: start city, end city, api_key
      # output = json with:
      # travel time (MapQuest API, new endpoint)
      # weather at eta (hourly weather based on approx arrival time)
    
    road_trip = MapquestFacade.new.road_trip(params[:origin], params[:destination])
    coordinates = MapquestFacade.new.coordinates(params[:destination])
    weather_at_eta = WeatherFacade.new.hourly_weather(coordinates)

    render json: RoadTripSerializer.format_road_trip(road_trip, weather_at_eta)
  end
end