#!/usr/bin/env ruby
n, k = readline.chomp.split.map(&:to_i)
r = k.times.map{readline.chomp.to_i}.sum
puts [-3, 3].map{|c| (r + c * (n - k)).to_f / n}.join(" ")
