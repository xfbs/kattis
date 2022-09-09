#!/usr/bin/env ruby
blocks = readline.chomp.to_i
height = 0
while blocks >= 0
  blocks -= (2*height+1)**2
  height += 1
end
puts (height - 1)
