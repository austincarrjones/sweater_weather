class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = MapquestFacade.new.coordinates(params[:location])
    combined_data = CombinedFacade.new.combined_forecast(coordinates)
    # binding.pry
    

   
  end
end
