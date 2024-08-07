class WeatherService

  def conn = Faraday.new(url: "http://api.weatherapi.com") do |request|
    request.params["key"] = Rails.application.credentials.weather[:key]
  end

  def current_weather(coordinates)
    response = conn.get("/v1/current.json?&q=#{coordinates}&aqi=no")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def daily_weather(coordinates)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no")
    json = JSON.parse(response.body, symbolize_names: true)
    daily_data = json[:forecast][:forecastday]
    daily_data
  end

  def hourly_weather(coordinates)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no")
    json = JSON.parse(response.body, symbolize_names: true)
    hourly_data = json[:forecast][:forecastday].first[:hour]
    hourly_data
  end

  def weather_at_eta(coordinates, date, rounded_hour)
    response = conn.get("/v1/forecast.json?&q=#{coordinates}&days=5&aqi=no&alerts=no&date=#{date}&hour=#{rounded_hour}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:forecast][:forecastday].first[:hour]
    # [{:time=>"2024-08-07 06:00", :temp_f=>57.3, :is_day=>0, :condition=>{:text=>"Mist", :icon=>"//cdn.weatherapi.com/weather/64x64/night/143.png", :code=>1030}}]
  end
end