#!/usr/bin/env ruby
readline.chomp.to_i.times do
  readline
  stores = readline.chomp.split.map(&:to_i)
  parking = (stores.min..stores.max).each.map{|pos| [pos, stores.map{|s| (s - pos).magnitude}.sum]}.min_by{|pos, dist| dist}
  puts parking
end

