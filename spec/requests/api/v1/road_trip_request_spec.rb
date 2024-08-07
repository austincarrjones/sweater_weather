require 'rails_helper'

RSpec.describe "Road Trip API" do
  describe "POST /api/v1/road_trip happy path" do
   it "returns road trip details and forecast of destination" do
      VCR.use_cassette("road_trip_and_time") do
        body_params = {
          origin: "Breckenridge, CO",
          destination: "Omaha, NE",
          api_key: "t1h2i3s4_i5s6_l7e8g9i10t11" #?
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
end