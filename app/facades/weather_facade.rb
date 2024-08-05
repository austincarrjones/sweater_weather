class WeatherFacade
  def current_weather(coordinates)
    current_weather_data = WeatherService.new.current_weather(coordinates)
    poro = CurrentWeather.new(current_weather_data).formatted
    # {
    #   current_weather: poro
    #   }
  end

  def daily_weather(coordinates)
    daily_weather_data = WeatherService.new.daily_weather(coordinates)
    poro_array = daily_weather_data.map do |day|
      DailyWeather.new(day).formatted
    end
    # {
    #   daily_weather: poro_array
    # }
  end

  def hourly_weather(coordinates)
    hourly_weather_data = WeatherService.new.hourly_weather(coordinates)
    poro_array = hourly_weather_data.map do |hour|
      HourlyWeather.new(hour).formatted
    end
    # {
    #   hourly_weather: poro_array
    # }
  end

  def combined_forecast(coordinates)
    {
      current_weather: current_weather(coordinates),
      daily_weather: daily_weather(coordinates),
      hourly_weather: hourly_weather(coordinates)
    }
  end
end