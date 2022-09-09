#!/usr/bin/env ruby
pre = 45
time = readline.chomp.split.map(&:to_i).inject(0){|a, b| 60*a + b}
time = (time - pre) % (24 * 60)
puts "#{time/60} #{time%60}"
