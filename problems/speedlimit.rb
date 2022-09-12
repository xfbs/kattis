loop do n=gets.to_i;break if n<0;p=0;puts "#{n.times.map{s,t=gets.split.map(&:to_i);r=s*(t-p);p=t;r}.sum} miles"; end
