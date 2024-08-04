class WeatherFacade
  def forecast(coordinates)
    binding.pry
    WeatherService.new.forecast(coordinates)
  end
end