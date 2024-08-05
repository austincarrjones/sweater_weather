require "rails_helper"

RSpec.describe WeatherService do
  describe "#currrent_weather" do
    it "should return a response body parsed from JSON" do
      VCR.use_cassette("current_weather") do
        parsed_json = WeatherService.new.current_weather("39.48221, -106.04645")

        expect(parsed_json).to be_a Hash
        expect(parsed_json[:current][:temp_f]).to be_a Float
      end
    end
  end

  describe "#forecast" do
    it "should return a response body parsed from JSON" do
      VCR.use_cassette("forecast") do
        parsed_json = WeatherService.new.forecast("39.48221, -106.04645")

        expect(parsed_json).to be_a Hash
        expect(parsed_json[:forecast]).to be_a Hash

        expect(parsed_json[:forecast][:forecastday][0][:day][:maxtemp_f]).to be_a Float
        expect(parsed_json[:forecast][:forecastday][0][:astro][:sunrise]).to be_a String

        expect(parsed_json[:forecast][:forecastday][0][:hour][0][:temp_f]).to be_a Float
        expect(parsed_json[:forecast][:forecastday][0][:hour][0][:condition][:text]).to be_a String
      end
    end
  end
end