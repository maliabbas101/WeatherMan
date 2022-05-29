# frozen_string_literal: true

require 'date'
class Data
  @indexes = []
  @max_array = []
  @min_array = []
  @mean_humidity = []
  @dates = []
  def self.read_data(year, month, path)
    newpath = "#{path}_#{year}_#{Date::ABBR_MONTHNAMES[month.to_i]}.txt"
    file = File.open(newpath)
    Array.new((file.readlines))
  end

  def self.return_array(file_data, parameters, zone)
    file_data.shift
    file_data.map do |line|
      x = line.split(',')
      if x[parameters.index('Max TemperatureC')] != ''
        @max_array << x[parameters.index('Max TemperatureC')]
        @dates << x[parameters.index(zone[0])] if parameters.include?('PKT')
        @dates << x[parameters.index(zone[1])] if parameters.include?('PKST')
        @dates << x[parameters.index(zone[2])] if parameters.include?('GST')
      end
      @min_array << x[parameters.index('Min TemperatureC')] if x[parameters.index('Min TemperatureC')] != ''
      @mean_humidity << x[parameters.index(' Mean Humidity')] if x[parameters.index(' Mean Humidity')] != ''
    end
    [@max_array, @min_array, @mean_humidity, @dates]
  end
end
