#!/usr/bin/env ruby
l, d, x = 3.times.map{readline.chomp.to_i}
puts (l..d).each.find{|n| n.to_s.chars.map(&:to_i).sum == x}
puts d.downto(l).each.find{|n| n.to_s.chars.map(&:to_i).sum == x}
