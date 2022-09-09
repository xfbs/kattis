#!/usr/bin/env ruby
a, b = readline.chomp.split.map(&:to_i)
puts (a > b) ? 1 : 0
