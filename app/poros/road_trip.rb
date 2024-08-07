class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time

  def initialize(origin, destination, travel_time)
    @start_city = origin
    @end_city = destination
    @travel_time = travel_time[:formattedTime]
    @travel_time_seconds = travel_time[:time]
  end

  def formatted
    {
      start_city: @start_city,
      end_city: @end_city,
      travel_time: @travel_time
    }
  end

  def eta
    eta = Time.now + @travel_time_seconds
    eta.strftime("%Y-%m-%d %H:%M:%S")
  end
end