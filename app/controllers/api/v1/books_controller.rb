class Api::V1::BooksController < ApplicationController

  def search
    # binding.pry
    # Params {"location"=>"denver,co", "quantity"=>"5", "controller"=>"api/v1/books", "action"=>"search"} >
    @books = BookFacade.new.books_by_place(params[:location], params[:quantity])
  end
end