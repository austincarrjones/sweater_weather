require "rails_helper"

RSpec.describe BookFacade do
  describe "#books_by_place" do
    it "should return hash of books" do 
      VCR.use_cassette("books_by_location") do
        response = BookFacade.new.books_by_place("denver,co", 5)

        expect(response).to be_a Hash
        expect(response[:total_books_found]).to be_an Integer
        expect(response[:books]).to be_an Array
        expect(response[:books].first).to be_a Hash
        expect(response[:books].first[:isbn]).to be_an Array
        expect(response[:books].first[:title]).to be_a String
        expect(response[:books].first[:publisher]).to be_an Array
      end
    end
  end
end
