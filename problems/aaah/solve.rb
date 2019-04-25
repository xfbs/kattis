#!/usr/bin/env ruby

require 'minitest'

module Aaah
  def self.run
    if solve(gets.chomp, gets.chomp)
      puts "go"
    else
      puts "no"
    end
  end

  def self.solve(a, b)
    a.size >= b.size
  end
end

class AaahTest < MiniTest::Test
  def test_01
    assert Aaah.solve("aaah", "ah")
  end

  def test_02
    assert !Aaah.solve("aaah", "aaaah")
  end

  def test_03
    assert Aaah.solve("aah", "aah")
  end
end

if ARGV[0] == "test"
  MiniTest.run
else
  Aaah.run
end
