class CurrentWeather
  attr_reader :last_updated,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :condition,
              :icon
              
  def initialize(current_weather)
    @last_updated = current_weather[:current][:last_updated]
    @temperature = current_weather[:current][:temp_f]
    @feels_like = current_weather[:current][:feelslike_f]
    @humidity = current_weather[:current][:humidity]
    @uvi = current_weather[:current][:uv]
    @visibility = current_weather[:current][:vis_miles]
    @condition = current_weather[:current][:condition][:text]
    @icon = current_weather[:current][:condition][:icon]
  end

  def formatted
    hash = {
            last_updated: @last_updated,
            temperature: @temperature,
            feels_like: @feels_like,
            humidity: @humidity,
            uvi: @uvi,
            visibility: @visibility,
            condition: @condition,
            icon: @icon
    }
  end
end