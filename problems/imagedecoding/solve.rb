#!/usr/bin/env ruby

require 'minitest'

module ImageDecoding
  def self.run
    first = true
    loop do
      length = gets.to_i
      if length == 0
        break
      else
        puts unless first
        first = false
      end
      linelens = []

      length.times do
        line = gets.chomp.split
        decoded = decode(line[0] == '#', *line[1..-1].map(&:to_i))
        puts decoded.map{|n| n && '#' || '.'}.join
        linelens << decoded.size
      end

      unless linelens.uniq.size == 1
        puts "Error decoding image"
      end
    end
  end

  def self.decode(start, *data)
    out = []
    data.zip([start, !start].cycle).each do |length, val|
      out += [val] * length
    end
    out
  end
end

class ImageDecodingTest < MiniTest::Test
  def test_01
    assert_equal [], ImageDecoding.decode(true)
    assert_equal [], ImageDecoding.decode(false)
    assert_equal [true], ImageDecoding.decode(true, 1)
    assert_equal [false], ImageDecoding.decode(false, 1)
    assert_equal [true, true], ImageDecoding.decode(true, 1, 0, 1)
    assert_equal [true, false, true], ImageDecoding.decode(true, 1, 1, 1)
    assert_equal [true, false, false, true, true, false], ImageDecoding.decode(true, 1, 2, 2, 1)
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  ImageDecoding.run
end
