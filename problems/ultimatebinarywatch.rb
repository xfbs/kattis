puts gets.chomp.chars.map{|c| c.to_i.digits(2).map{|d|d==1?'*':'.'}.join.ljust(4,'.').chars.reverse}.transpose.map{|l| l.insert(2," ").join(" ")}.join("\n")
