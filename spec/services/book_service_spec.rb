require "rails_helper"

RSpec.describe BookService do
  describe "#books_by_place" do
    it "should return a response body parsed from JSON" do 
      VCR.use_cassette("books_by_location") do
        parsed_json = BookService.new.books_by_place("denver,co", 5)

        expect(parsed_json).to be_a Hash
        expect(parsed_json[:numFound]).to be_an Integer
        expect(parsed_json[:docs]).to be_an Array
        expect(parsed_json[:docs].first).to be_a Hash
        expect(parsed_json[:docs].first[:isbn]).to be_an Array
        expect(parsed_json[:docs].first[:title]).to be_a String
        expect(parsed_json[:docs].first[:publisher]).to be_an Array
      end
    end
  end
end