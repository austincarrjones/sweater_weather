
require "rails_helper"

RSpec.describe WeatherFacade do
  describe "#current_weather" do
    it "should return hash of current weather" do 
      VCR.use_cassette("current_weather") do
        response = WeatherFacade.new.current_weather("39.48221, -106.04645")

        expect(response).to be_a Hash
        # {:current_weather=>
        #   {:last_updated=>"2024-08-04 20:00", 
        #   :temperature=>49.5, 
        #   :feels_like=>49.4, 
        #   :humidity=>84, 
        #   :uvi=>3.0, 
        #   :visibility=>5.0, 
        #   :condition=>"Patchy rain nearby", 
        #   :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png"}}

      end
    end
  end

  describe "#daily_weather" do
  it "should return hash of daily weather" do 
    VCR.use_cassette("forecast") do
      response = WeatherFacade.new.daily_weather("39.48221, -106.04645")

      expect(response).to be_a Hash
      # expect(response[:data][:id]).to eq(null)
      # expect(response[:data][:attributes]).to be_a Hash
      # expect(response[:data][:attributes][:current_weather]).to be_a Hash
      # expect(response[:data][:attributes][:current_weather][:temperature]).to be_a Float
    end
  end
end

  
end