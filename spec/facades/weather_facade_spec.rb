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
        # binding.pry
        expect(response).to be_a Hash
        expect(response[:daily_weather]).to be_an Array
        expect(response[:daily_weather].first[:date]).to be_a String

          #     {:daily_weather=>
          # [{:date=>"2024-08-04", :sunrise=>"06:07 AM", :sunset=>"08:13 PM", :max_temp=>72.6, :min_temp=>46.8, :condition=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png"},
          #  {:date=>"2024-08-05", :sunrise=>"06:08 AM", :sunset=>"08:12 PM", :max_temp=>67.3, :min_temp=>45.8, :condition=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png"},
          #  {:date=>"2024-08-06", :sunrise=>"06:09 AM", :sunset=>"08:11 PM", :max_temp=>71.5, :min_temp=>45.6, :condition=>"Patchy rain nearby", :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png"},
          #  {:date=>"2024-08-07", :sunrise=>"06:10 AM", :sunset=>"08:09 PM", :max_temp=>71.8, :min_temp=>46.7, :condition=>"Patchy rain nearby", :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png"},
          #  {:date=>"2024-08-08", :sunrise=>"06:11 AM", :sunset=>"08:08 PM", :max_temp=>70.7, :min_temp=>45.3, :condition=>"Patchy rain nearby", :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png"}]}
      end
    end
  end

  describe "#hourly_weather" do
    it "should return hash of hourly weather" do 
      VCR.use_cassette("forecast") do
        response = WeatherFacade.new.hourly_weather("39.48221, -106.04645")
        # binding.pry
        expect(response).to be_a Hash
        expect(response[:hourly_weather]).to be_an Array
        expect(response[:hourly_weather].first[:time]).to be_a String
        expect(response[:hourly_weather].first[:temperature]).to be_a Float
      end
    end
  end


end