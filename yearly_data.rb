# frozen_string_literal: true

class YearlyData
  @max_yarray = []
  @min_yarray = []
  @humid_yarray = []
  @date_yarray = []
  def self.return_yarray(harray, attribs, zone)
    harray.each do |element|
      element.each do |line|
        temp = line.split(',')
        if temp[attribs.index('Max TemperatureC')] != ''
          @max_yarray << temp[attribs.index('Max TemperatureC')]
          @date_yarray << temp[attribs.index(zone[0])] if attribs.include?('PKT')
          @date_yarray << temp[attribs.index(zone[1])] if attribs.include?('PKST')
          @date_yarray << temp[attribs.index(zone[2])] if attribs.include?('GST')
        end
        @min_yarray << temp[attribs.index('Min TemperatureC')] if temp[attribs.index('Min TemperatureC')] != ''
        @humid_yarray << temp[attribs.index('Max Humidity')] if temp[attribs.index('Max Humidity')] != ''
      end
    end
    [@max_yarray, @min_yarray, @humid_yarray, @date_yarray]
  end
end
