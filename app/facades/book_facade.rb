class BookFacade
  def books_by_place(location, quantity)
    books_data = BookService.new.books_by_place(location, quantity)
    total_books_found = books_data[:numFound]
    books = books_data[:docs].map do |book|
      Books.new(book).formatted
    end
    {
      total_books_found: total_books_found,
      books: books
    }
  end
end