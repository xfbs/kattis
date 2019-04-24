#!/usr/bin/env ruby

require 'minitest'

module RacingAlphabet
  def self.run
    gets.chomp.to_i.times do
      puts solve(gets.chomp)
    end
  end

  def self.solve(str)
    letters = str.split("")
    time = letters.size
    time += letters[0..-2]
      .zip(letters[1..])
      .map{|a, b| seconds(distance(slots(a, b)))}
      .sum
  end

  def self.slots(a, b)
    alphabet = ('A'..'Z').to_a + [' ', "'"]
    reverse = alphabet.each_with_index.to_h
    dist = (reverse[a] - reverse[b]) % alphabet.size
    odist = (reverse[b] - reverse[a]) % alphabet.size
    [dist, odist].min
  end

  def self.distance(slots)
    diameter = 60
    circumference = Math::PI * diameter
    slots_total = 28
    distance_slots = circumference / slots_total
    distance = slots * distance_slots
  end

  def self.seconds(distance)
    speed = 15
    distance/speed
  end
end

class RacingAlphabetTest < MiniTest::Test
  def test_slots
    assert_equal 0, RacingAlphabet.slots('A', 'A')
    assert_equal 1, RacingAlphabet.slots('A', 'B')
    assert_equal 1, RacingAlphabet.slots('B', 'A')
    assert_equal 1, RacingAlphabet.slots('A', "'")
    assert_equal 1, RacingAlphabet.slots("'", 'A')
  end

  def test_distance
    assert_in_delta 188.5, RacingAlphabet.distance(28), 0.1
  end

  def test_seconds
    assert_in_delta 25, RacingAlphabet.seconds(377), 0.2
  end

  def test_solve
    assert_in_delta 187.6156641641, 
      RacingAlphabet.solve("WINNING ISN'T EVERYTHING IT'S THE ONLY THING"), 0.000001
    assert_in_delta 190.4108599662,
      RacingAlphabet.solve("WINNERS DON'T WAIT FOR CHANCES THEY TAKE THEM"), 0.000001
    assert_in_delta 193.1036536692,
      RacingAlphabet.solve("PAIN IS ONLY TEMPORARY BUT VICTORY IS FOREVER"), 0.000001
  end
end

if ARGV[0] == "test"
  MiniTest.run
else
  RacingAlphabet.run
end
