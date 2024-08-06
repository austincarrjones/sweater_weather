class MapquestService

  def conn = Faraday.new(url: "https://www.mapquestapi.com") do |request|
    request.params["key"] = Rails.application.credentials.mapquest[:key]
  end

  def coordinates(location)
    response = conn.get("/geocoding/v1/address?&location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]
  end

  def travel_time(origin, destination)
    binding.pry
    response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    json[:route][:formattedTime]
    # :formattedTime=>"08:23:57"
  end
end