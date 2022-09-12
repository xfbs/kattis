n,m=gets.split.map(&:to_i);t=(1..n).map{|d| (1..m).map{|e| d+e}}.flatten.tally;m=t.max_by{|a,b|b}[1];puts t.filter{|a,b|b==m}.map{|a,b|a}
