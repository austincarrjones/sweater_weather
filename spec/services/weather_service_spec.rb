require "rails_helper"

RSpec.describe WeatherService do
  describe "#currrent_weather" do
    it "should return a response body parsed from JSON" do
      VCR.use_cassette("current_weather") do
        parsed_json = WeatherService.new.current_weather("39.48221, -106.04645")
        # binding.pry
        expect(parsed_json).to be_a Hash
        expect(parsed_json[:location]).to be_a Hash
        expect(parsed_json[:location][:name]).to be_a String
        expect(parsed_json[:current]).to be_a Hash
        expect(parsed_json[:current][:last_updated]).to be_a String
        expect(parsed_json[:current][:temp_f]).to be_a Float
        expect(parsed_json[:current][:condition]).to be_a Hash
        expect(parsed_json[:current][:condition][:text]).to be_a String
        expect(parsed_json[:current][:condition][:icon]).to be_a String
        expect(parsed_json[:current][:humidity]).to be_a Integer
        expect(parsed_json[:current][:feelslike_f]).to be_a Float
        expect(parsed_json[:current][:vis_miles]).to be_a Float
        expect(parsed_json[:current][:uv]).to be_a Float
      end
    end
  end

  describe "#daily_weather" do
    it "should return a response body parsed from JSON" do
      VCR.use_cassette("forecast") do
        parsed_json = WeatherService.new.daily_weather("39.48221, -106.04645")

        expect(parsed_json).to be_an Array
        expect(parsed_json.first[:date]).to be_a String
        expect(parsed_json.first[:day]).to be_a Hash
        expect(parsed_json.first[:day][:maxtemp_f]).to be_a Float
        expect(parsed_json.first[:day][:mintemp_f]).to be_a Float
        expect(parsed_json.first[:day][:condition]).to be_a Hash
        expect(parsed_json.first[:day][:condition][:text]).to be_a String
        expect(parsed_json.first[:day][:condition][:icon]).to be_a String
        expect(parsed_json.first[:astro]).to be_a Hash
        expect(parsed_json.first[:astro][:sunrise]).to be_a String
        expect(parsed_json.first[:astro][:sunrise]).to be_a String
      end
    end
  end

  describe "#hourly_weather" do
    xit "should return a response body parsed from JSON" do
      VCR.use_cassette("forecast") do
        parsed_json = WeatherService.new.hourly_weather("39.48221, -106.04645")

        expect(parsed_json).to be_an Array
        expect(parsed_json.first[:date]).to be_a String
        expect(parsed_json.first[:day]).to be_a Hash
        expect(parsed_json.first[:day][:maxtemp_f]).to be_a Float
        expect(parsed_json.first[:day][:mintemp_f]).to be_a Float
        expect(parsed_json.first[:day][:condition]).to be_a Hash
        expect(parsed_json.first[:day][:condition][:text]).to be_a String
        expect(parsed_json.first[:day][:condition][:icon]).to be_a String
        expect(parsed_json.first[:astro]).to be_a Hash
        expect(parsed_json.first[:astro][:sunrise]).to be_a String
        expect(parsed_json.first[:astro][:sunrise]).to be_a String
      end
    end
  end
end