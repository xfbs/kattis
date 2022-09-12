gets.to_i.times{i,b,n=gets.split.map(&:to_i);puts"#{i} #{n.digits(b).map{|n|n**2}.sum}"}
