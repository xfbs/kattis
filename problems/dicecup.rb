#!/usr/bin/env ruby
faces = readline.chomp.split.map(&:to_i)
puts faces.map{|f| (f-1)/2.0}.map{|f| [f.floor, f.ceil].uniq}.inject([0]){|a,b| a.product(b)}.map{|a| a.flatten[1..].sum}.uniq.sort
