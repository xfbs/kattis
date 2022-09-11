c=gets.to_f;p gets.to_i.times.map{gets.split.map(&:to_f).inject(c,&:*)}.sum
