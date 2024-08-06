require "rails_helper"

RSpec.describe CurrentWeather do
  it "exists" do
    attributes = 
    {
      :location=> {
        :name=>"Breckenridge", 
        :region=>"Colorado", 
        :country=>"United States of America", 
        :lat=>39.48, 
        :lon=>-106.05, 
        :tz_id=>"America/Denver", 
        :localtime_epoch=>1722823554, 
        :localtime=>"2024-08-04 20:05"
      },
      :current=> {
        :last_updated=>"2024-08-04 20:00",
        :temp_f=>49.5,
        :is_day=>1,
        :condition=> {
          :text=>"Patchy rain nearby", 
          :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png", 
          :code=>1063
        },
        :humidity=>84,
        :feelslike_f=>49.4,
        :vis_miles=>5.0,
        :uv=>3.0
      }
    }

    current_weather = CurrentWeather.new(attributes)
    
    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.last_updated).to be_a String
    expect(current_weather.temperature).to be_an Float
    expect(current_weather.feels_like).to be_a Float
    expect(current_weather.humidity).to be_an Integer
    expect(current_weather.uvi).to be_a Float
    expect(current_weather.visibility).to be_a Float
    expect(current_weather.condition).to be_a String
    expect(current_weather.icon).to be_a String

    expect(current_weather).not_to respond_to(:localtime_epoch)
    expect(current_weather).not_to respond_to(:code)
    expect(current_weather).not_to respond_to(:tz_id)
  end
end