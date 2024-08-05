class CombinedFacade
  
  def combined_forecast
    current_weather = WeatherFacade.new.current_weather(coordinates)
    binding.pry
    forecast = WeatherFacade.new.forecast(coordinates)
    binding.pry
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: CurrentWeather.new(current_weather).format,
          daily_weather: DailyWeather.new(daily_weather).format,
          hourly_weather: HourlyWeather.new(hourly_weather).format
        }
      }
    }
  end
end