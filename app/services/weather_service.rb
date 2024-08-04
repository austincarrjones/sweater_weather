class WeatherService

  def conn = Faraday.new(url: "http://api.weatherapi.com") do |request|
    request.params["key"] = Rails.application.credentials.weather[:key]
  end

  def forecast(coordinates)
    response = conn.get("/v1/current.json?&q=#{coordinates}&aqi=no")
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end