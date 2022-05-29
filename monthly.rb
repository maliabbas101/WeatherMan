# frozen_string_literal: true

require './Scripts/data'
require 'colorize'
class Monthly
  @plus_array = []
  def self.plus(array, array2, date)
    array.zip(array2, date).each do |element, element1, date1|
      print "#{date1.split('-').last} "
      element.to_i.abs.times do
        print '+'.red
      end
      print " #{element}C"
      puts
      print "#{date1.split('-').last} "
      element1.to_i.abs.times do
        print '+'.blue
      end
      print " #{element1}C"
      puts
    end
  end

  def self.monthly_data(zone)
    year = ARGV[1][0..3]
    month = ARGV[1][5]
    path = ARGV[2]
    file_data = Data.read_data(year, month, path)
    Data.return_array(file_data, file_data[0].split(','), zone)
  end
end
