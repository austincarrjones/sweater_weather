class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time

  def initialize(origin, destination, travel_time)
    @start_city = origin
    @destination = destination
    @travel_time = travel_time
  end

  def formatted
    {
      start_city: @start_city,
      end_city: @end_city,
      travel_time: @travel_time
    }
  end
end