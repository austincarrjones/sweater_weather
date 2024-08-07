class Api::V1::RoadTripsController < ApplicationController
  
  before_action :authenticate_api_key, only: [:create]

  def create
    if params[:api_key]
      road_trip = RoadTripFacade.new.road_trip(params[:origin], params[:destination])
      if road_trip[:travel_time] == "Impossible"
        render json: RoadTripSerializer.format_impossible_road_trip(road_trip)
      else
        eta = RoadTripFacade.new.eta(road_trip)
        binding.pry
        coordinates = RoadTripFacade.new.coordinates(params[:destination])
        weather_at_eta = RoadTripFacade.new.weather_at_eta(coordinates, eta)
        render json: RoadTripSerializer.format_road_trip(road_trip[:start_end_time], weather_at_eta)
      end
    else
      render json: { error: "bad credentials"}, status: :unauthorized
    end
  end


  private

  def authenticate_api_key
    api_key = params[:api_key]
    @user = User.find_by(api_key: api_key)

    if @user.nil?
      render json: { error: "Invalid API key" }, status: :unauthorized
    end
  end
end