# frozen_string_literal: true

require './Scripts/yearly'
require './Scripts/monthly'
require './Scripts/data'
require './Scripts/basicmaths'
require './Scripts/yearly_data'
if ARGV[0] == '-a' || ARGV[0] == '-c'
  max_array, min_array, humid_array, date_array = Monthly.monthly_data(BasicMaths.returnzone)
end
case ARGV[0]
when '-e'
  arr = Yearly.yearspecific
  huge_array, attri = Yearly.merge(arr)
  max_yarray, min_yarray, humid_yarray, date_yarray = YearlyData.return_yarray(huge_array, attri, BasicMaths.returnzone)
  puts BasicMaths.maxmin(max_yarray, date_yarray, 'max', 'Highest', 'C')
  puts BasicMaths.maxmin(min_yarray, date_yarray, 'min', 'Lowest', 'C')
  puts BasicMaths.maxmin(humid_yarray, date_yarray, 'max', 'Humid', '%')
when '-a'
  puts "Highest Average:#{BasicMaths.avg(max_array)}C"
  puts "Lowest Average:#{BasicMaths.avg(min_array)}C"
  puts "Humidity Average:#{BasicMaths.avg(humid_array)}%"
when '-c'
  Monthly.plus(max_array, min_array, date_array)
else
  raise StandardError, 'Invalid Command'
end
