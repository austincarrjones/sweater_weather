class BookFacade
  def books_by_place(location, quantity)
    books_data = BookService.new.books_by_place(location, quantity)
  end
end