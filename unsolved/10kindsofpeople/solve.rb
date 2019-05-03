#!/usr/bin/env ruby

require 'minitest'

module TenKindsOfPeople
  def self.run
    y, _ = gets.chomp.split.map(&:to_i)
    map = y.times.map{gets.chomp.split("").map(&:to_i)}
    gets.chomp.to_i.times do
      y1, x1, y2, x2 = gets.chomp.split.map(&:to_i)
      distmap = distances(map: map, origin: [y1 - 1, x1 - 1])
      if distmap[y2 - 1][x2 - 1]
        if map[y2 - 1][x2 - 1] == 1
          puts "decimal"
        else
          puts "binary"
        end
      else
        puts "neither"
      end
    end
  end

  def self.distances(map:, origin:)
    new = [origin]
    type = map[origin[0]][origin[1]]

    # array with same dimensions as map
    distmap = Array.new(map.size){Array.new}

    # directions in which we can travel
    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    until new.empty?
      # current coordinates and distance from current coordinate
      cur = new.pop
      distmap[cur[0]][cur[1]] = true

      # check points in all directions
      directions.each do |dy, dx|
        y = cur[0] + dy
        x = cur[1] + dx

        if 0 <= y && 0 <= x && map[y] && map[y][x] == type
          unless distmap[y][x]
            new << [y, x]
          end
        end
      end
    end

    distmap
  end
end

class TenKindsOfPeopleTest < MiniTest::Test
  def test_distances
    assert_equal [[true, true], [true, true]], TenKindsOfPeople.distances(map: [[0,0],[0,0]], origin: [0,0])
    assert_equal [
      [true, true, true, true, true, nil, true, true],
      [true, true, nil, true, true, nil, true, true],
      [true, nil, nil, nil, true, true, nil, true],
      [true, true, true, true, true, true, nil, true],
      [nil, nil, true, true, true, nil, true, true],
      [true, true, true, true, true, true, true, true],
      [true, nil, nil, true, nil, true, true, true],
      [true, nil, nil, true, true, nil, nil, true]], TenKindsOfPeople.distances(map: [
      [1, 1, 1, 1, 1, 0, 1, 1],
      [1, 1, 0, 1, 1, 0, 1, 1],
      [1, 0, 0, 0, 1, 1, 0, 1],
      [1, 1, 1, 1, 1, 1, 0, 1],
      [0, 0, 1, 1, 1, 0, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1],
      [1, 0, 0, 1, 0, 1, 1, 1],
      [1, 0, 0, 1, 1, 0, 0, 1]], origin: [2, 5])
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  TenKindsOfPeople.run
end
