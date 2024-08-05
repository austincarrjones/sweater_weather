class DailyWeather
  attr_reader

  def initialize(day)
    @date = day[:date]
    @sunrise = day[:astro][:sunrise]
    @sunset = day[:astro][:sunset]
    @max_temp = day[:day][:maxtemp_f]
    @min_temp = day[:day][:mintemp_f]
    @condition = day[:day][:condition][:text]
    @icon = day[:day][:condition][:icon]
  end

  def formatted
    hash = {
            date: @date,
            sunrise: @sunrise,
            sunset: @sunset,
            max_temp: @max_temp,
            min_temp: @min_temp,
            condition: @condition,
            icon: @icon
    }
  end
end