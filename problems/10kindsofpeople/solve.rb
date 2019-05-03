#!/usr/bin/env ruby

require 'minitest'

module TenKindsOfPeople
  def self.run
  end

  def self.distances(map:, origin:)
    new = [origin]
    type = map[origin[0]][origin[1]]

    # array with same dimensions as map
    distmap = Array.new(map.size){Array.new(map.first.size)}
    distmap[origin[0]][origin[1]] = 0

    # directions in which we can travel
    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    until new.empty?
      # current coordinates and distance from current coordinate
      cur = new.shift
      cur_dist = distmap[cur[0]][cur[1]] + 1

      # check points in all directions
      directions.each do |dy, dx|
        y = cur[0] + dy
        x = cur[1] + dx

        # if this point exists and is the type we want
        if 0 <= y && map[y] && 0 <= x && map[y][x] == type
          # if we don't have a distance yet or we have a higher distance than need be
          if distmap[y][x].nil? || distmap[y][x] > cur_dist
            # update distance and make sure we investigate this point going forward
            distmap[y][x] = cur_dist
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
    assert_equal [[0, 1], [1, 2]], TenKindsOfPeople.distances(map: [[0,0],[0,0]], origin: [0,0])
    assert_equal [
      [7, 6, 5, 4, 3, nil, 13, 12],
      [8, 7, nil, 3, 2, nil, 12, 11],
      [7, nil, nil, nil, 1, 0, nil, 10],
      [6, 5, 4, 3, 2, 1, nil, 9],
      [nil, nil, 5, 4, 3, nil, 7, 8],
      [8, 7, 6, 5, 4, 5, 6, 7],
      [9, nil, nil, 6, nil, 6, 7, 8],
      [10, nil, nil, 7, 8, nil, nil, 9]], TenKindsOfPeople.distances(map: [
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
