#!/usr/bin/env ruby
readline.chomp.to_i.times.map{|i| [i,readline.chomp]}.filter{|i,w| i % 2 == 0}.each{|i,w| puts w}
