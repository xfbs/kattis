s=gets.to_i.times.map{gets=~/pink|rose/i&&1||0}.sum;puts s==0?"I must watch Star Wars with my daughter":s
