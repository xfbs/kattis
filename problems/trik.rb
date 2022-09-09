#!/usr/bin/env ruby
pos = 1
moves = {}
moves['A'] = {1=>2, 2=>1, 3=>3}
moves['B'] = {1=>1, 2=>3, 3=>2}
moves['C'] = {1=>3, 2=>2, 3=>1}
readline.chomp.split("").each do |move|
  pos = moves[move][pos]
end
puts pos
