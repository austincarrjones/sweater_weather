class RoadTripFacade
  def road_trip(origin, destination)
    road_trip = MapquestFacade.new.road_trip(origin, destination)
    if road_trip[:travel_time] == "Impossible"
      road_trip
    else
      road_trip[:start_end_time]
    end
  end

  def coordinates(destination)
    MapquestFacade.new.coordinates(destination)
  end

  def eta(origin, destination)
    road_trip = MapquestFacade.new.road_trip(origin, destination)
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
    # [{:datetime=>"2024-08-07 06:00", :temperature=>57.3, :condition=>"Mist"}]
  end

end