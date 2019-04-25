#!/usr/bin/env ruby

require 'minitest'

module Carrots
  def self.run
    puts gets.split[1]
  end
end

class CarrotsTest < MiniTest::Test
  def test_fail
    assert false
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Carrots.run
end
