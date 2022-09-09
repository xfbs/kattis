#!/usr/bin/env ruby
readline.chomp.to_i.times do
  num, days = readline.chomp.split.map(&:to_i)
  candles = days + (days * (days + 1) / 2)
  puts "#{num} #{candles}"
end
