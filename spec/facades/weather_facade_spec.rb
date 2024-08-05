require "rails_helper"

RSpec.describe WeatherFacade do
  describe "#current_weather" do
    it "should return hash of current weather" do 
      VCR.use_cassette("current_weather") do
        response = WeatherFacade.new.current_weather("39.48221, -106.04645")

        expect(response).to be_a Hash
        expect(response).to be_a Hash
        expect(response[:last_updated]).to be_a String
        expect(response[:temperature]).to be_a Float
        expect(response[:feels_like]).to be_a Float
        expect(response[:humidity]).to be_an Integer
        expect(response[:uvi]).to be_a Float
        expect(response[:visibility]).to be_a Float
        expect(response[:condition]).to be_a String
        expect(response[:icon]).to be_a String

        # expect(response).to not
      end
    end
  end

  describe "#daily_weather" do
    it "should return hash of daily weather" do 
      VCR.use_cassette("forecast") do
        response = WeatherFacade.new.daily_weather("39.48221, -106.04645")

        expect(response).to be_an Array
        expect(response.first[:date]).to be_a String
        expect(response.first[:sunrise]).to be_a String
        expect(response.first[:sunset]).to be_a String
        expect(response.first[:max_temp]).to be_a Float
        expect(response.first[:min_temp]).to be_a Float
        expect(response.first[:condition]).to be_a String
        expect(response.first[:icon]).to be_a String
      end
    end
  end

  describe "#hourly_weather" do
    it "should return hash of hourly weather" do 
      VCR.use_cassette("forecast") do
        response = WeatherFacade.new.hourly_weather("39.48221, -106.04645")

        expect(response).to be_an Array
        expect(response.first[:time]).to be_a String
        expect(response.first[:temperature]).to be_a Float
        expect(response.first[:conditions]).to be_a String
        expect(response.first[:icon]).to be_a String
      end
    end
  end


end