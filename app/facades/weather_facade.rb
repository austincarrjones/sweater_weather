class WeatherFacade
  def current_weather(coordinates)
    WeatherService.new.current_weather(coordinates)
  end

  def forecast(coordinates)
    WeatherService.new.forecast(coordinates)
  end
end