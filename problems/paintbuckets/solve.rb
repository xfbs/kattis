#!/usr/bin/env ruby

require 'minitest'

module PaintBuckets
  def self.run
    storage, orders = gets
      .chomp
      .split
      .map(&:to_i)
      .map{|n| n.times.map{gets.chomp.split.map(&:to_i)}.to_h}

    p storage
    p orders
  end
end

class PaintBucketsTest < MiniTest::Test
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  PaintBuckets.run
end
