#!/usr/bin/env ruby

readline.chomp.to_i.times do
  input = readline.chomp.split.map(&:to_i)
  puts (input[1..].sum - (input[0] - 1))
end


