#!/usr/bin/env ruby
n, w, h = readline.chomp.split.map(&:to_i)
max = Math.sqrt(w**2 + h**2)
n.times do
  puts (readline.chomp.to_i <= max) ? "DA" : "NE"
end
