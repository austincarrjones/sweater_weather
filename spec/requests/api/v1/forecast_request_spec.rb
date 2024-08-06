require 'rails_helper'

RSpec.describe "Forecast API" do
  describe "GET /api/v1/forecast happy path" do
    it "returns weather forecast for city,state" do
      VCR.use_cassette("location_current_weather") do
        params = "cincinnatti,oh"

        get "/api/v1/forecast?location=#{params}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        forecast = JSON.parse(response.body, symbolize_names: true)

        expect(forecast[:data]).to be_a Hash
        expect(forecast[:data][:id]).to eq(nil)
        expect(forecast[:data][:type]).to eq("forecast")
        expect(forecast[:data][:attributes]).to be_a Hash

        expect(forecast[:data][:attributes][:current_weather]).to be_a Hash
        expect(forecast[:data][:attributes][:current_weather][:last_updated]).to be_a String
        expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a Float
        expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a Float
        expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_an Integer
        expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a Float
        expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a Float
        expect(forecast[:data][:attributes][:current_weather][:condition]).to be_an String
        expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a String

        expect(forecast[:data][:attributes][:daily_weather]).to be_an Array
        expect(forecast[:data][:attributes][:daily_weather].first[:date]).to be_a String 
        expect(forecast[:data][:attributes][:daily_weather].first[:sunrise]).to be_a String 
        expect(forecast[:data][:attributes][:daily_weather].first[:sunset]).to be_a String 
        expect(forecast[:data][:attributes][:daily_weather].first[:max_temp]).to be_a Float
        expect(forecast[:data][:attributes][:daily_weather].first[:min_temp]).to be_a Float
        expect(forecast[:data][:attributes][:daily_weather].first[:condition]).to be_a String 
        expect(forecast[:data][:attributes][:daily_weather].first[:icon]).to be_a String

        expect(forecast[:data][:attributes][:hourly_weather]).to be_an Array
        expect(forecast[:data][:attributes][:hourly_weather].first[:time]).to be_a String 
        expect(forecast[:data][:attributes][:hourly_weather].first[:temperature]).to be_a Float
        expect(forecast[:data][:attributes][:hourly_weather].first[:conditions]).to be_a String 
        expect(forecast[:data][:attributes][:hourly_weather].first[:icon]).to be_a String 

        # expect(forecast[:data]).not_to have_content()
      end
    end
  end

  describe "GET /api/v1/forecast sad path" do
    xit "will gracefully handle if a city/state is incorrect" do
      params = "cincinatti,oh"

      get "/api/v1/forecast?location=#{params}"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq("404")
      expect(data[:errors].first[:title]).to eq("Couldn't find weather with location=zanzibar")
    end
  end
end