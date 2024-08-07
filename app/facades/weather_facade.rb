class WeatherFacade
  def current_weather(coordinates)
    current_weather_data = WeatherService.new.current_weather(coordinates)
    CurrentWeather.new(current_weather_data).formatted
  end

  def daily_weather(coordinates)
    daily_weather_data = WeatherService.new.daily_weather(coordinates)
    daily_weather_data.map do |day|
      DailyWeather.new(day).formatted
    end
  end

  def hourly_weather(coordinates)
    hourly_weather_data = WeatherService.new.hourly_weather(coordinates)
    hourly_weather_data.map do |hour|
      HourlyWeather.new(hour).formatted
    end
  end

  def combined_forecast(coordinates)
    {
      current_weather: current_weather(coordinates),
      daily_weather: daily_weather(coordinates),
      hourly_weather: hourly_weather(coordinates)
    }
  end

  def weather_at_eta(coordinates, date, rounded_hour)
    weather_data = WeatherService.new.weather_at_eta(coordinates, date, rounded_hour)
    weather_data.map do |data|
      ArrivalWeather.new(data).formatted
    end
  end
end