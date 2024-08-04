class Api::V1::ForecastController < ApplicationController

  def show(params)
    coordinates = MapquestService
  end
end


#input https://www.mapquestapi.com/geocoding/v1/address?key=dd1xwCSdgb6UO8lwp8B3Pocf7dDDySJI&location=cincinnatti,oh
#output [:results][1][0][:latLng]