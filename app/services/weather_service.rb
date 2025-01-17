class WeatherService

  def conn = Faraday.new(url: "http://api.weatherapi.com") do |request|
    request.params["key"] = Rails.application.credentials.weather[:key]
  end

  def current_weather(coordinates)
    response = conn.get("/v1/current.json?&q=#{coordinates}&aqi=no")
    JSON.parse(response.body, symbolize_names: true)
  end

  def daily_weather(coordinates)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:forecast][:forecastday]
  end

  def hourly_weather(coordinates)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:forecast][:forecastday].first[:hour]
  end

  def weather_at_eta(coordinates, date, rounded_hour)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no&date=#{date}&hour=#{rounded_hour}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:forecast][:forecastday].first[:hour]
  end
end