d=gets.split.map(&:to_i);puts d[..1].zip(d[2..].map{|n|n+2}).all?{|a,b|a>=b}?1:0
