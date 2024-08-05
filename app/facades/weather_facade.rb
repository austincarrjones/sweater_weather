class WeatherFacade
  def current_weather(coordinates)
    current_weather = WeatherService.new.current_weather(coordinates)
    binding.pry
    poro = CurrentWeather.new(current_weather)
    binding.pry 
    formatted = {
      current_weather: {
                        last_updated: poro.last_updated,
                        temperature: poro.temperature,
                        feels_like: poro.feels_like,
                        humidity: poro.humidity,
                        uvi: poro.uvi,
                        visibility: poro.visibility,
                        condition: poro.condition,
                        icon: poro.icon,
      }
    }
    binding.pry
  end

  def daily_weather(coordinates)
    daily_weather = WeatherService.new.daily_weather(coordinates)
    daily_weather.each do |day|
      DailyWeather.new(day)
    end
  end
end