gets.to_i.times{r,e,c=gets.split.map(&:to_i);puts({-1=>"advertise",0=>"does not matter",1=>"do not advertise"}[r<=>(e-c)])}
