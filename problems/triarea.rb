#!/usr/bin/env ruby
puts readline.chomp.split.map(&:to_i).inject(1.0, &:*) / 2
