m=gets.to_i;r=m.times.map{gets.split.map(&:to_i)};p r[..-2].zip(r[1..]).map{|a,b|(b[1]-a[1])/(b[0]-a[0])}.max
