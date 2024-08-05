class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = MapquestFacade.new.coordinates(params[:location])
    combined_forecast = WeatherFacade.new.combined_forecast(coordinates)
    json = render json: ForecastSerializer.format_forecast(combined_forecast)
    binding.pry
    json
  end
end
