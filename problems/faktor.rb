#!/usr/bin/env ruby

articles, impact = readline.chomp.split.map(&:to_i)
bribe = (0..).find{|b| (b / articles.to_f).ceil >= impact}
puts bribe
