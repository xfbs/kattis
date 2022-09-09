#!/usr/bin/env ruby
g, s, c = readline.chomp.split.map(&:to_i)
power = g * 3 + s * 2 + c * 1
cards = []
cards << [["Province", 8], ["Duchy", 5], ["Estate", 2]].find{|name, cost| cost <= power}
cards << [["Gold", 6], ["Silver", 3], ["Copper", 0]].find{|name, cost| cost <= power}
puts cards.compact.map{|name, val| name}.join(" or ")
