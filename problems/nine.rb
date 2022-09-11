#!/usr/bin/env ruby

require 'minitest'

module Nine
  def self.run
    gets.to_i.times do
      puts solve(gets.to_i)
    end
  end

  def self.solve(n)
    8 * 9.pow(n - 1, 1_000_000_007) % 1_000_000_007
  end
end

class NineTest < MiniTest::Test
  def test_01
    assert_equal 8, Nine.solve(1)
    assert_equal 72, Nine.solve(2)
    assert_equal 343393926, Nine.solve(100)
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Nine.run
end
