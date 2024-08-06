class MapquestFacade
  def coordinates(location)
    latlng = MapquestService.new.coordinates(location)
    latlng.values_at(:lat, :lng).map(&:to_s).join(',')
  end

  def road_trip(origin, destination)
    travel_time = MapquestService.new.travel_time(origin, destination)
    RoadTrip.new(origin, destination, travel_time).formatted
  end
end