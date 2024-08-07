require "rails_helper"

RSpec.describe RoadTripFacade do
  describe "#road_trip" do
    it "should return hash of start city, end city, and travel time" do 
      VCR.use_cassette("road_trip_facade") do
        response = RoadTripFacade.new.road_trip("Breckenridge,CO", "Omaha, NE")

        expect(response).to be_a Hash
        expect(response[:start_end_time]).to be_a Hash
        expect(response[:start_end_time][:start_city]).to be_a String
        expect(response[:start_end_time][:end_city]).to be_a String
        expect(response[:start_end_time][:travel_time]).to be_a String
        expect(response[:eta]).to be_a String

        expect(response).not_to have_key([:origin])
      end
    end
  end

  describe "#eta" do
    it "should return hash of start city, end city, and travel time" do 
      VCR.use_cassette("road_trip_facade") do
        road_trip = RoadTripFacade.new.road_trip("Breckenridge,CO", "Omaha, NE")
        eta = RoadTripFacade.new.eta(road_trip)

        expect(eta).to be_a Hash
        expect(eta[:date]).to be_a String
        expect(eta[:rounded_hour]).to be_an Integer

        expect(eta).not_to have_key([:time])
      end
    end
  end
end