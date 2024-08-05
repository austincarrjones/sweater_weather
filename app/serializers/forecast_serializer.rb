class ForecastSerializer
  def self.format_forecast(combined_forecast)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: combined_forecast[:current_weather],
          daily_weather: combined_forecast[:daily_weather],
          hourly_weather: combined_forecast[:hourly_weather]
        }
      }
    }
  end
end