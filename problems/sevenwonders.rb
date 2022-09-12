t=gets.chomp.chars.tally;p t.map{|k,v|v**2}.sum+7*"TCG".chars.map{|c|t[c]||0}.min
