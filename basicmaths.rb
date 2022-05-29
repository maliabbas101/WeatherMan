# frozen_string_literal: true

require 'date'
class BasicMaths
  def self.avg(array)
    temp = array.map(&:to_i)
    temp.sum / temp.size
  end

  def self.maxmin(array, date, operation, string, symbol)
    int_array = array.map(&:to_i)
    if operation == 'max'
      temp = date[(int_array.index(int_array.max))].split('-')
      return "#{string}:#{int_array.max}#{symbol} on #{Date::MONTHNAMES[temp[-2].to_i]} #{temp[-1]}"
    end
    temp = date[(int_array.index(int_array.min))].split('-')
    "#{string}:#{int_array.min}#{symbol} on #{Date::MONTHNAMES[temp[-2].to_i]} #{temp[-1]}"
  end

  def self.returnzone
    %w[PKT PKST GST]
  end
end
