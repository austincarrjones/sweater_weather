require "rails_helper"

RSpec.describe HourlyWeather do
  it "exists" do
    attributes = 
    {
      :time=>"2024-08-04 00:00", 
      :temp_f=>50.8, 
      :is_day=>0, 
      :condition=>{
        :text=>"Clear ", 
        :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png", 
        :code=>1000
      }
    }
    
    hourly_weather = HourlyWeather.new(attributes)

    expect(hourly_weather).to be_a HourlyWeather
    expect(hourly_weather.time).to be_a String
    expect(hourly_weather.temperature).to be_a Float
    expect(hourly_weather.conditions).to be_a String
    expect(hourly_weather.icon).to be_a String
    
    expect(hourly_weather).not_to respond_to(:code)
    expect(hourly_weather).not_to respond_to(:is_day)
  end
end