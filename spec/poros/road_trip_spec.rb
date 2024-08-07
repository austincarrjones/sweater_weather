require "rails_helper"

RSpec.describe RoadTrip do
  it "exists" do
    origin = "Breckenridge, CO"
    destination = "Omaha, NE"
    travel_time = {
      :sessionId=>"AI4A_",
      :realTime=>30547,
      :distance=>616.2499,
      :time=>30211,
      :formattedTime=>"08:23:31",
      :hasHighway=>true,
      :hasTollRoad=>false,
    }
    
    road_trip = RoadTrip.new(origin, destination, travel_time)

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.start_city).to be_a String
    expect(road_trip.end_city).to be_a String
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.travel_time_seconds).to be_a Integer
    
    expect(road_trip).not_to respond_to(:hasHighway)
    expect(road_trip).not_to respond_to(:SessionId)
  end
end