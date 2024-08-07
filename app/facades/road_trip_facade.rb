class RoadTripFacade
  def road_trip(origin, destination)
    road_trip = MapquestFacade.new.road_trip(origin, destination)
    binding.pry
    road_trip[:start_end_time]
  end

  def coordinates(destination)
    MapquestFacade.new.coordinates(destination)
  end

  def eta(origin, destination)
    road_trip = MapquestFacade.new.road_trip(origin, destination)
    binding.pry
    road_trip[:eta]
  end

  def weather_at_eta(coordinates, eta)
    binding.pry
    hourly_weather = WeatherFacade.new.hourly_weather(coordinates)
    hourly_weather #pinpoint hour of the hash here
  end

end