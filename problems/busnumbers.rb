#!/usr/bin/env ruby

require 'minitest'

module BusNumbers
  def self.run
    gets
    numbers = gets
      .chomp
      .split
      .map(&:to_i)
    puts consolidate(numbers)
      .map{|n| if n.is_a? Range then "#{n.begin}-#{n.end}" else n.to_i end}
      .join(" ")
  end

  def self.consolidate(numbers)
    numbers.sort!
    consolidated = []

    numbers.each do |num|
      last = consolidated.last

      if last.is_a? Range
        if (num - last.end) == 1
          consolidated.pop
          consolidated << Range.new(last.begin, num)
          next
        end
      end

      if last.is_a?(Integer) && (num - last) == 1
        prev = consolidated[-2]
        if prev && prev.is_a?(Integer) && (num - prev) == 2
          consolidated.pop(2)
          consolidated << Range.new(prev, num)
          next
        end
      end

      consolidated << num
    end


    consolidated
  end
end

class BusNumbersTest < MiniTest::Test
  def test_01
    assert_equal [], BusNumbers.consolidate([])
    assert_equal [123], BusNumbers.consolidate([123])
    assert_equal [175, 180], BusNumbers.consolidate([180, 175])
    assert_equal [1, 2, 5], BusNumbers.consolidate([2, 5, 1])
    assert_equal [1..3, 5], BusNumbers.consolidate([1, 3, 2, 5])
    assert_equal [141..143, 174, 175, 180], BusNumbers.consolidate([180, 141, 174, 143, 142, 175])
  end
end

if ARGV[0] == 'test'
  MiniTest.autorun
else
  BusNumbers.run
end
