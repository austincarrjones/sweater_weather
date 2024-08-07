require "rails_helper"

RSpec.describe ArrivalWeather do
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
    
    arrival_weather = ArrivalWeather.new(attributes)

    expect(arrival_weather).to be_a ArrivalWeather
    expect(arrival_weather.datetime).to be_a String
    expect(arrival_weather.temperature).to be_a Float
    expect(arrival_weather.condition).to be_a String
    
    expect(arrival_weather).not_to respond_to(:code)
    expect(arrival_weather).not_to respond_to(:is_day)
  end
end