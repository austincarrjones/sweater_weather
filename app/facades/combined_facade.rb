class CombinedFacade
  
  def combined_forecast(coordinates)
    current_weather = WeatherFacade.new.current_weather(coordinates)
    binding.pry
    forecast = WeatherFacade.new.forecast(coordinates)
    binding.pry
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: current_weather
          # daily_weather: DailyWeather.new(forecast).format,
          # hourly_weather: HourlyWeather.new(forecast).format
        }
      }
    }
  end
end