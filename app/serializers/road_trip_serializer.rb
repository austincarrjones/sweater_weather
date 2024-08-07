class RoadTripSerializer
  def self.format_road_trip(road_trip, weather_at_eta)
    {
      data: {
        id: nil,
        type: "road_trip",
        attributes: {
          start_city: road_trip[:start_city],
          end_city: road_trip[:end_city],
          travel_time: road_trip[:travel_time],
          weather_at_eta: { 
            datetime: weather_at_eta.first[:datetime],
            temperature: weather_at_eta.first[:temperature],
            condition: weather_at_eta.first[:condition]
          }
        }
      }
    }
  end

  def self.format_impossible_road_trip(road_trip)
    {
      data: {
        id: nil,
        type: "road_trip",
        attributes: {
          start_city: road_trip[:start_city],
          end_city: road_trip[:end_city],
          travel_time: road_trip[:travel_time],
          weather_at_eta: { 
          }
        }
      }
    }
  end
end