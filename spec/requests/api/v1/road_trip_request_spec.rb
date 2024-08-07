require 'rails_helper'

RSpec.describe "Road Trip API" do
  describe "POST /api/v1/road_trip happy path" do
   it "returns road trip details and forecast of destination" do
      VCR.use_cassette("road_trip_and_time") do
        user = User.create(email: "test@example.com", password: "password", password_confirmation: "password", api_key: SecureRandom.hex)

        body_params = {
          origin: "Breckenridge, CO",
          destination: "Omaha, NE",
          api_key: user.api_key
        } 

        post api_v1_road_trip_path, params: body_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        road_trip = JSON.parse(response.body, symbolize_names: true)

        expect(road_trip[:data]).to be_a Hash
        expect(road_trip[:data][:id]).to eq(nil)
        expect(road_trip[:data][:type]).to eq("road_trip")
        expect(road_trip[:data][:attributes]).to be_a Hash

        expect(road_trip[:data][:attributes][:start_city]).to eq("Breckenridge, CO")
        expect(road_trip[:data][:attributes][:end_city]).to eq ("Omaha, NE")
        expect(road_trip[:data][:attributes][:travel_time]).to be_a String
        expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
        expect(road_trip[:data][:attributes][:weather_at_eta][:datetime]).to be_a String
        expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
        expect(road_trip[:data][:attributes][:weather_at_eta][:condition]).to be_a String
      end
    end
  end

  describe "POST /api/v1/road_trip sad paths" do
    it "returns error if api key not found" do
      VCR.use_cassette("road_trip_and_time") do
        body_params = {
          origin: "Breckenridge, CO",
          destination: "Omaha, NE",
          api_key: "notarealkey"
        } 

        post api_v1_road_trip_path, params: body_params

        expect(response).to_not be_successful
        expect(response.status).to eq(401)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a Hash
        expect(data[:error]).to eq("Invalid API key")
     end
    end

    it "returns impossible travel time and empty weather" do
      VCR.use_cassette("road_trip_fail") do
        user = User.create(email: "test@example.com", password: "password", password_confirmation: "password", api_key: SecureRandom.hex)

        body_params = {
          origin: "Breckenridge, CO",
          destination: "London, UK",
          api_key: user.api_key
        } 

        post api_v1_road_trip_path, params: body_params

        expect(response).to be_successful
        expect(response.status).to eq(200)
        binding.pry
        road_trip = JSON.parse(response.body, symbolize_names: true)

        expect(road_trip[:data]).to be_a Hash
        expect(road_trip[:data][:id]).to eq(nil)
        expect(road_trip[:data][:type]).to eq("road_trip")
        expect(road_trip[:data][:attributes]).to be_a Hash

        expect(road_trip[:data][:attributes][:start_city]).to eq("Breckenridge, CO")
        expect(road_trip[:data][:attributes][:end_city]).to eq ("Omaha, NE")
        expect(road_trip[:data][:attributes][:travel_time]).to eq("Impossible")
        expect(road_trip[:data][:attributes][:weather_at_eta]).to eq(nil)
      end
    end
  end
end