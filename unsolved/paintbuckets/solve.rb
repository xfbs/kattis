#!/usr/bin/env ruby

require 'minitest'

module PaintBuckets
  def self.run
    # read in storage and orders
    storage, orders = gets
      .chomp
      .split
      .map(&:to_i)
      .map{|n| n
        .times
        .map{ gets
          .chomp
          .split
          .map(&:to_i)}}

    # consolidate storage (add up volumes)
    storage = storage.inject({}) do |h, p|
      h[p.first] ||= 0;
      h[p.first] += p.last;
      h
    end

    # check for each order if it can be filled
    orders.each do |hue, volume|
      if has(storage, hue, volume)
        puts "yes"
      else
        puts "no"
      end
    end
  end

  def self.has(storage, hue, volume)
    (-1000..1000)
      .map{|offset| hue + offset}
      .map{|hue| storage[hue]}
      .compact
      .inject(0, :+) >= volume
  end
end

class PaintBucketsTest < MiniTest::Test
end

if ARGV[0] == 'test'
  MiniTest.autorun
else
  PaintBuckets.run
end
