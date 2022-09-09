#!/usr/bin/env ruby

require 'minitest'

module Solution
  def self.run
    number = gets.to_i
    numbers = []
    number.times do
      numbers << gets.to_i
    end
    puts self.solve(numbers)
  end

  def self.solve numbers
    numbers.map do |number|
      string = number.to_s
      num = string[0..-2].to_i
      exponent = string[-1..].to_i
      num**exponent
    end.sum
  end
end

class CarrotsTest < MiniTest::Test
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Solution.run
end
