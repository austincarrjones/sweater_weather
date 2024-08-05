class HourlyWeather
  attr_reader

  def initialize(hour)
    @time = hour[:time]
    @temperature = hour[:temp_f]
    @conditions = hour[:condition][:text]
    @icon = hour[:condition][:icon]
  end

  def extract_time(datetime_str)
    Time.parse(datetime_str).strftime("%H:%M")
  end

  def formatted
    hash = {
            time: extract_time(@time),
            temperature: @temperature,
            conditions: @conditions,
            icon: @icon
    }
  end
end