#!/usr/bin/env ruby
hands, domsuit = readline.chomp.split
scores = {'A'=>[11,11],'K'=>[4,4],'Q'=>[3,3,],'J'=>[20,2],'T'=>[10,10],'9'=>[14,0],'8'=>[0,0],'7'=>[0,0]}
sum = 0
(4*hands.to_i).times do
  card, suit = readline.chomp.split("")
  sum += scores[card][(suit == domsuit) ? 0 : 1]
end
puts sum
