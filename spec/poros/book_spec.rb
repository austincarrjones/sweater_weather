require "rails_helper"

RSpec.describe Book do
  it "exists" do
    attributes = {
      isbn:["9780449149478", "0449149471"], 
      :publisher=>["Fawcett"], 
      :title=>"Murder Mile High (Liz Sullivan Mysteries)" 
    }

    book = Book.new(attributes)

    expect(book).to be_a Book
    expect(book.isbn).to be_an Array
    expect(book.publisher).to be_an Array
    expect(book.title).to be_a String
  end
end