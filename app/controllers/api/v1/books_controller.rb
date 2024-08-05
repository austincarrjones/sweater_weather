class Api::V1::BooksController < ApplicationController
  def search
    # binding.pry
    # Params {"location"=>"denver,co", "quantity"=>"5", "controller"=>"api/v1/books", "action"=>"search"} >
    books = BookFacade.new.books_by_place(params[:location], params[:quantity])
    binding.pry
    coordinates = MapquestFacade.new.coordinates(params[:location])
    currrent_forecast = WeatherFacade.new.current_weather(coordinates)
    json = render json: BooksSerializer.format(currrent_forecast, books)
  end
end

#books:
# {:total_books_found=>4,
#  :books=>
#   [{:isbn=>["9780449149478", "0449149471"], :title=>"Murder Mile High (Liz Sullivan Mysteries)", :publisher=>["Fawcett"]},
#    {:isbn=>nil, :title=>"Meet the Malones", :publisher=>["original -Thomas Y. Crowell Co., 1943"]},
#    {:isbn=>["0615423906", "9780615423906"], :title=>"Healers and hellraisers", :publisher=>["Denver Health Foundation"]},
#    {:isbn=>nil, :title=>"Denver County Colorado Marriage Index 1873-1939", :publisher=>["Hunting For Bears Genealogical Society and Library"]}]}