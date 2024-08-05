class BookService

  def books_by_place(location, quantity)
    response = Faraday.get("https://openlibrary.org/search.json?place=#{location}&fields=title,isbn,publisher&limit=#{quantity}")
    json = JSON.parse(response.body, symbolize_names: true)
    json
  end

end