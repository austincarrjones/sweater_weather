class MapquestService

  def conn = Faraday.new(url: "https://www.mapquestapi.com") do |request|
    request.params["key"] = Rails.application.credentials.mapquest[:key]
  end

  def coordinates(location)
    response = conn.get("/geocoding/v1/address?&location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
    latlng = json[:results][0][:locations][0][:latLng]
    #output {:lat=>39.10713, :lng=>-84.50413}
  end
end