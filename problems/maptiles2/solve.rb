#!/usr/bin/env ruby

require 'minitest'
require 'matrix'

module MapTiles2
  def self.run
    maptile = gets.chomp
    puts "#{maptile.size} #{coordinate(maptile).to_a.join(" ")}"
  end

  def self.vectors(maptile)
    return if maptile.size.zero?

    cur = case maptile[0]
    when "0"
      Vector[0, 0]
    when "1"
      Vector[1, 0]
    when "2"
      Vector[0, 1]
    when "3"
      Vector[1, 1]
    end

    if maptile[1..-1].size != 0
      vectors(maptile[1..-1]).unshift(cur)
    else
      [cur]
    end
  end

  def self.coordinate(maptile)
    vectors(maptile)
      .inject(Vector[0, 0]){|v, c| 2 * v + c}
  end
end

class MapTiles2Test < MiniTest::Test
  def test_01
    assert_equal [Vector[0, 0]], MapTiles2.vectors("0")
    assert_equal [Vector[1, 0]], MapTiles2.vectors("1")
    assert_equal [Vector[0, 1]], MapTiles2.vectors("2")
    assert_equal [Vector[1, 1]], MapTiles2.vectors("3")
    assert_equal [Vector[0, 0], Vector[1, 0], Vector[0, 1], Vector[1, 1]],
      MapTiles2.vectors("0123")
  end

  def test_02
    assert_equal Vector[0, 0], MapTiles2.coordinate("0")
    assert_equal Vector[1, 0], MapTiles2.coordinate("1")
    assert_equal Vector[0, 1], MapTiles2.coordinate("2")
    assert_equal Vector[1, 1], MapTiles2.coordinate("3")
    assert_equal Vector[3, 0], MapTiles2.coordinate("11")
    assert_equal Vector[0, 3], MapTiles2.coordinate("22")
    assert_equal Vector[6, 2], MapTiles2.coordinate("130")
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  MapTiles2.run
end
