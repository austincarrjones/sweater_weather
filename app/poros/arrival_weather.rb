class ArrivalWeather
  attr_reader :datetime,
              :temperature,
              :condition

  def initialize(data)
    @datetime = data[:time]
    @temperature = data[:temp_f]
    @condition = data[:condition][:text]
  end

  def formatted
    {
      datetime: @datetime,
      temperature: @temperature,
      condition: @condition
    }
  end
end