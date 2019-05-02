#!/usr/bin/env ruby

require 'minitest'

module SmallSchedule
  def self.run
    puts solve(*gets.chomp.split.map(&:to_i))
  end

  def self.solve long_time, machines, slots, long_slots
    # minimum iterations needed to finish long slots
    min_long = (long_slots / machines.to_f)

    # how much time we need for those iterations
    total_time = min_long.ceil * long_time

    # how much computing time is left after doing long slots
    leftover = (machines * (total_time - (min_long * long_time))).round

    # subtract leftover from slots
    slots -= leftover

    if slots > 0
      total_time += (slots / machines.to_f).ceil
    end

    total_time
  end
end

class SmallScheduleTest < MiniTest::Test
  def test_given
    assert_equal 4, SmallSchedule.solve(2, 4, 3, 6)
    assert_equal 6, SmallSchedule.solve(3, 4, 3, 5)
    assert_equal 10, SmallSchedule.solve(10, 2, 0, 1)
  end

  def test_own
    # test time for simple slots
    assert_equal 0, SmallSchedule.solve(3, 3, 0, 0)
    assert_equal 1, SmallSchedule.solve(3, 3, 1, 0)
    assert_equal 1, SmallSchedule.solve(3, 3, 2, 0)
    assert_equal 1, SmallSchedule.solve(3, 3, 3, 0)
    assert_equal 2, SmallSchedule.solve(3, 3, 4, 0)
    assert_equal 3, SmallSchedule.solve(3, 2, 5, 0)
    assert_equal 6, SmallSchedule.solve(3, 1, 6, 0)

    # test time for long slots
    assert_equal 3, SmallSchedule.solve(3, 3, 0, 1)
    assert_equal 3, SmallSchedule.solve(3, 3, 0, 2)
    assert_equal 3, SmallSchedule.solve(3, 3, 0, 3)
    assert_equal 6, SmallSchedule.solve(3, 3, 0, 4)
    assert_equal 6, SmallSchedule.solve(3, 3, 0, 6)
    assert_equal 6, SmallSchedule.solve(2, 3, 0, 7)

    # test time for combination
    assert_equal 4, SmallSchedule.solve(3, 3, 4, 2)
    assert_equal 6, SmallSchedule.solve(3, 3, 3, 5)

    # big number
    assert_equal 703946, SmallSchedule.solve(2, 3, 487484, 812177)
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  SmallSchedule.run
end
