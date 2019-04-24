#!/usr/bin/env ruby

require 'minitest'

module CalculatingDartScores
  def self.run
    num = gets.chomp.to_i
    chosen = solve(num)

    if chosen.size > 3
      puts "impossible"
    else
      puts chosen
        .map{|t, m| ["single", "double", "triple"][m-1] + " #{t/m}"}
        .join("\n")
    end
  end

  def self.solve(n)
    darts = (1..3)
      .zip([1..20].cycle)
      .map{|m, n| n.zip([m].cycle)}
      .flatten(1)
      .map{|m, n| [m*n, n]}
      .sort_by{|m, n| m}
      .reverse

    chosen = []
    while n != 0
      chosen << darts.find{|m, _| m <= n}
      n -= chosen.last.first
    end

    # this is a bit of a hack. if we only manage to find a solution with 4
    # dart throws, just delete the last three throws, remove the triple 20
    # from the list of possible throws, and try again. weird but works.
    if chosen.size == 4 && chosen.last.first == 1
      left = chosen[-3..-1].map{|n, _| n}.sum
      chosen.pop 3
      darts.shift

      while left != 0
        chosen << darts.find{|m, _| m <= left}
        left -= chosen.last.first
      end
    end

    chosen
  end
end

class CalculatingDartScoresTest < MiniTest::Test
  def test_01
    assert_equal CalculatingDartScores.solve(180), [[60, 3], [60, 3], [60, 3]]
  end

  def test_02
    assert_equal CalculatingDartScores.solve(96), [[60, 3], [36, 3]]
  end

  def test_03
    assert_equal CalculatingDartScores.solve(27), [[27, 3]]
  end

  def test_04
    assert_equal CalculatingDartScores.solve(145), [[60, 3], [57, 3], [28, 2]]
    assert_equal CalculatingDartScores.solve(149), [[60, 3], [57, 3], [32, 2]]
    assert_equal CalculatingDartScores.solve(151), [[60, 3], [57, 3], [34, 2]]
    assert_equal CalculatingDartScores.solve(155), [[60, 3], [57, 3], [38, 2]]
    assert_equal CalculatingDartScores.solve(157), [[60, 3], [57, 3], [40, 2]]
  end
end

if ARGV[0] == "test"
  MiniTest.run
else
  CalculatingDartScores.run
end
