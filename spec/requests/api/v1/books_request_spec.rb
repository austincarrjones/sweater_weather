require 'rails_helper'

RSpec.describe "Books API" do
  describe "GET /api/v1/book-search happy path" do
    it "returns books based on destination city provided by user" do
      VCR.use_cassette("books_by_location") do
        location = "denver,co"
        quantity = 5
        
        get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        books = JSON.parse(response.body, symbolize_names: true)

        expect(books[:data]).to be_a Hash
        expect(books[:data][:id]).to eq(nil)
        expect(books[:data][:attributes]).to be_a Hash

        expect(books[:data][:attributes][:destination]).to be_a String

        expect(books[:data][:attributes][:forecast]).to be_a Hash
        expect(books[:data][:attributes][:forecast][:summary]).to be_a String
        expect(books[:data][:attributes][:forecast][:temperature]).to be_a Float

        expect(books[:data][:attributes][:total_books_found]).to be_an Integer

        expect(books[:data][:attributes][:books]).to be_an Array
        expect(books[:data][:attributes][:books].first).to be_a Hash
        expect(books[:data][:attributes][:books].first[:isbn]).to be_an Array
        expect(books[:data][:attributes][:books].first[:title]).to be_a String
        expect(books[:data][:attributes][:books].first[:publisher]).to be_an Array
      end
    end
  end
end