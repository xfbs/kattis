#!/usr/bin/env ruby
times = readline.chomp.to_i
if times % 2 == 1
  puts "still running"
else
  puts times.times.map{readline.chomp.to_i}.each_slice(2).map{|a, b| b - a}.sum
end
