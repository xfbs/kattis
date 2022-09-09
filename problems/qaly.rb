#!/usr/bin/env ruby
puts readline.chomp.to_i.times.map{readline.chomp.split.map(&:to_f).inject(1.0, &:*)}.sum
