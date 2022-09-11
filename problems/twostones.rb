#!/usr/bin/env ruby

require 'minitest'

module TwoStones
  def self.run
    if gets.chomp.to_i.odd? 
      puts "Alice"
    else
      puts "Bob"
    end
  end
end

class TwoStonesTest < MiniTest::Test
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  TwoStones.run
end
