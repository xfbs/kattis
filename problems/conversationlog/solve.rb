#!/usr/bin/env ruby

require 'minitest'
require 'set'

module ConversationLog
  def self.run
    # sets contains "username" => (word => occurences)
    sets = Hash.new{|h, k| h[k] = Hash.new{|h, k| h[k] = 0}}

    gets
      .to_i
      .times
      .map{gets.chomp.split}
      .each{|n, *a| a.each{|w| sets[n][w] += 1}}

    exit if sets.empty?
    all = sets.values.map{|v| v.keys}.inject(:&)
    all_freq = all.map{|w| [w, sets.values.map{|v| v[w]}.sum]}.to_h
    all_freq = all_freq.sort_by{|k, _| k}.sort_by{|_, v| -v}
    all_freq.each{|v, _| puts v}
    puts "ALL CLEAR" if all_freq.empty?
  end
end

class ConversationLogTest < MiniTest::Test
end

if ARGV[0] == 'test'
  MiniTest.autorun
else
  ConversationLog.run
end
