class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = MapquestFacade.new.coordinates(params[:location])
    binding.pry
    @forecast = WeatherFacade.new.forecast(coordinates)
    render json
  end
end
