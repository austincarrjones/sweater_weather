class Books
  attr_reader

  def initialize(book)
    @isbn = book[:isbn]
    @title = book[:title]
    @publisher = book[:publisher]
  end

  def formatted
    {
      isbn: @isbn,
      title: @title,
      publisher: @publisher
    }
  end
end