class ForecastSerializer
  def self.format_forecast(forecast)
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