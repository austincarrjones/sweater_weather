class MapquestFacade
  def coordinates(location)
    latlng = MapquestService.new.coordinates(location)
    latlng_string = latlng.values_at(:lat, :lng).map(&:to_s).join(',')
  end
end