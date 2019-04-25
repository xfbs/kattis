#!/usr/bin/env ruby

require 'minitest'

module Carrots
  def self.run
    puts gets.split[1]
  end
end

class CarrotsTest < MiniTest::Test
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Carrots.run
end
