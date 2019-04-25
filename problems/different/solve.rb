#!/usr/bin/env ruby

require 'minitest'

module Different
  def self.run
    while line = gets
      puts difference(*line.chomp.split.map(&:to_i))
    end
  end

  def self.difference(a, b)
    (a - b).abs
  end
end

class DifferentTest < MiniTest::Test
  def test_01
    assert_equal 2, Different.difference(10, 12)
    assert_equal 71293781685339, Different.difference(71293781758123, 72784)
    assert_equal 12345677654320, Different.difference(1, 12345677654321)
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Different.run
end
