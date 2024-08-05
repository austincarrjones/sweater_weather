class WeatherFacade
  def current_weather(coordinates)
    current_weather_data = WeatherService.new.current_weather(coordinates)
    poro = CurrentWeather.new(current_weather_data).formatted
    {
      current_weather: poro
      }
    # binding.pry
    # {
    #   current_weather: {
    #                     last_updated: poro.last_updated,
    #                     temperature: poro.temperature,
    #                     feels_like: poro.feels_like,
    #                     humidity: poro.humidity,
    #                     uvi: poro.uvi,
    #                     visibility: poro.visibility,
    #                     condition: poro.condition,
    #                     icon: poro.icon,
    #   }
    # }
  end

  def daily_weather(coordinates)
    daily_weather_data = WeatherService.new.daily_weather(coordinates)
    poro_array = daily_weather_data.map do |day|
      DailyWeather.new(day).formatted
    end
    {
      daily_weather: poro_array
    }
  end


end







# {
#   daily_weather: [
#                   {
#                     date: poro[0].date,
#                     sunrise: poro[0].sunrise,
#                     sunset: poro[0].sunset,
#                     max_temp: poro[0].max_temp,
#                     min_temp: poro[0].min_temp,
#                     condition: poro[0].condition,
#                     icon: poro[0].icon
#                 },
#                   {
#                     date: poro[1].date,
#                     sunrise: poro[1].sunrise,
#                     sunset: poro[1].sunset,
#                     max_temp: poro[1].max_temp,
#                     min_temp: poro[1].min_temp,
#                     condition: poro[1].condition,
#                     icon: poro[1].icon
#                 },
#                   {
#                     date: poro[2].date,
#                     sunrise: poro[2].sunrise,
#                     sunset: poro[2].sunset,
#                     max_temp: poro[2].max_temp,
#                     min_temp: poro[2].min_temp,
#                     condition: poro[2].condition,
#                     icon: poro[2].icon
#                 },
#                   {
#                     date: poro[3].date,
#                     sunrise: poro[3].sunrise,
#                     sunset: poro[3].sunset,
#                     max_temp: poro[3].max_temp,
#                     min_temp: poro[3].min_temp,
#                     condition: poro[3].condition,
#                     icon: poro[3].icon
#                 },
#                   {
#                     date: poro[4].date,
#                     sunrise: poro[4].sunrise,
#                     sunset: poro[4].sunset,
#                     max_temp: poro[4].max_temp,
#                     min_temp: poro[4].min_temp,
#                     condition: poro[4].condition,
#                     icon: poro[4].icon
#                 },
#   ]
# }