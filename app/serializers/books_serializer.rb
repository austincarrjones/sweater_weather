class BooksSerializer
  def self.format(current_forecast, books, location)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: current_forecast[:condition],
            temperature: current_forecast[:temperature]
          },
          total_books_found: books[:total_books_found],
          books: books[:books]
        }
      }
    }
  end
end