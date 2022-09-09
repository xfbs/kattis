#!/usr/bin/env ruby
puts 5.times.map{|i| [i + 1, readline.chomp.split.map(&:to_i).sum]}.max_by{|n, s| s}.join(" ")
