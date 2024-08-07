class Api::V1::RoadTripsController < ApplicationController

  def create
    # params = {"origin"=>"Breckenridge, CO", "destination"=>"Omaha, NE", "api_key"=>"t1h2i3s4_i5s6_l7e8g9i10t11"
    if params[:api_key]
      road_trip = RoadTripFacade.new.road_trip(params[:origin], params[:destination])
      eta = RoadTripFacade.new.eta(params[:origin], params[:destination])
      coordinates = RoadTripFacade.new.coordinates(params[:destination])
      weather_at_eta = RoadTripFacade.new.weather_at_eta(coordinates, eta)
      render json: RoadTripSerializer.format_road_trip(road_trip, weather_at_eta)
    else
      render json: { error: "bad credentials"}, status: :unauthorized
    end
  end
end