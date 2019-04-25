#!/usr/bin/env ruby

require 'minitest'

module Bijele
  def self.run
    numbers = gets.split.map(&:to_i)
    puts solve(numbers).join("\n")
  end

  def self.solve(numbers)
    wanted = [1, 1, 2, 2, 2, 8]
    wanted.zip(numbers).map{|wants, has| wants - has}
  end
end

class BijeleTest < MiniTest::Test
  def test_01
    assert_equal Bijele.solve([0, 1, 2, 2, 2, 7]), [1, 0, 0, 0, 0, 1]
  end

  def test_02
    assert_equal Bijele.solve([1, 1, 2, 2, 2, 8]), [0, 0, 0, 0, 0, 0]
  end

  def test_03
    assert_equal Bijele.solve([2, 1, 2, 1, 2, 1]), [-1, 0, 0, 1, 0, 7]
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Bijele.run
end
