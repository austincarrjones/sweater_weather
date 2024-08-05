class Api::V1::BooksController < ApplicationController
  def search
    books = BookFacade.new.books_by_place(params[:location], params[:quantity])
    coordinates = MapquestFacade.new.coordinates(params[:location])
    current_forecast = WeatherFacade.new.current_weather(coordinates)
    render json: BooksSerializer.format(current_forecast, books, params[:location])
  end
end