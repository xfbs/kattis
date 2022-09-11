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
    numbers.sum - (numbers.length - 1)
  end
end

class SolutionTest < MiniTest::Test
  def test1
    assert_equal Solution.solve([21, 34, 18, 9]), 79
  end

  def test2
    assert_equal Solution.solve([1, 50, 40]), 89
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Solution.run
end
