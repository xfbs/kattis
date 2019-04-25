#!/usr/bin/env ruby

require 'minitest'

module FizzBuzz
  def self.run
    numbers = gets.split.map(&:to_i)
    puts solve(*numbers).join("\n")
  end

  def self.solve(x, y, n)
    (1..n).map do |i|
      r = []
      r << "Fizz" if i.%(x).zero?
      r << "Buzz" if i.%(y).zero?
      r << i if r.empty?
      r.join
    end
  end
end

class DrinkTest < MiniTest::Test
  def test_01
    assert_equal FizzBuzz.solve(2, 3, 7),
      ["1", "Fizz", "Buzz", "Fizz", "5", "FizzBuzz", "7"]
  end

  def test_02
    assert_equal FizzBuzz.solve(2, 4, 7),
      ["1", "Fizz", "3", "FizzBuzz", "5", "Fizz", "7"]
  end

  def test_03
    assert_equal FizzBuzz.solve(3, 5, 7),
      ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7"]
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  FizzBuzz.run
end
