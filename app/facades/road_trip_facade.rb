class RoadTripFacade
  def road_trip(origin, destination)
    MapquestFacade.new.road_trip(origin, destination)
  end

  def coordinates(destination)
    MapquestFacade.new.coordinates(destination)
  end

  def eta(road_trip)
    eta = road_trip[:eta]
    date, time = eta.split(' ')
    time_obj = Time.parse(time)
    if time_obj.min < 30
      rounded_hour = time_obj.hour
      {
        date: date,
        rounded_hour: rounded_hour
      }
    else
      minutes_to_add = 60 - time_obj.min
      rounded_hour = (time_obj + (minutes_to_add * 60)).hour
      {
        date: date,
        rounded_hour: rounded_hour
      }
    end
  end

  def weather_at_eta(coordinates, eta)
    WeatherFacade.new.weather_at_eta(coordinates, eta[:date], eta[:rounded_hour])
  end

end