s=gets;puts s.chars.zip(s[1..].chars).any?{|a,b|a==b&&a=="s"}?"hiss":"no hiss"
