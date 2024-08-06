require "rails_helper"

RSpec.describe DailyWeather do
  it "exists" do
    attributes = 
    {
      :date=>"2024-08-04",
      :day=>{
        :maxtemp_f=>72.6, 
        :mintemp_f=>46.8, 
        :avgtemp_f=>55.3, 
        :condition=>{
          :text=>"Moderate rain", 
          :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png", 
          :code=>1189
        }
      },
      :astro=>{
        :sunrise=>"06:07 AM", 
        :sunset=>"08:13 PM"
      },
      :hour=>[
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
      ]
    }
    
    daily_weather = DailyWeather.new(attributes)

    expect(daily_weather).to be_a DailyWeather
    expect(daily_weather.date).to be_a String
    expect(daily_weather.sunrise).to be_a String
    expect(daily_weather.sunset).to be_a String
    expect(daily_weather.max_temp).to be_a Float
    expect(daily_weather.min_temp).to be_a Float
    expect(daily_weather.condition).to be_a String
    expect(daily_weather.icon).to be_a String
    
    expect(daily_weather).not_to respond_to(:hour)
  end
end
