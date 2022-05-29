# frozen_string_literal: true

class Yearly
  @files_array = []
  @huge_array = []
  @attributes = []
  def self.yearspecific
    Dir["#{ARGV[2]}/*"].select do |i|
      x = i.split('/')
      @files_array << x[-1] if x[-1].include? ARGV[1]
    end
    @files_array
  end

  def self.merge(arr)
    arr.each do |element|
      file = File.open("#{ARGV[2]}/#{element}")
      if ARGV[2].split('/')[-1] == 'lahore_weather'
        2.times do
          @attributes = file.readline.split(',')
        end
      else
        @attributes = file.readline.split(',')
      end
      @huge_array << file.readlines
    end
    [@huge_array, @attributes]
  end
end
