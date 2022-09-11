s=gets.chars;puts s.zip(s[1..]).filter{|a,b|a!=b}.map{|a,b|a}.join
