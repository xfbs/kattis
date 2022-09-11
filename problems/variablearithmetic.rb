#!/usr/bin/env ruby

require 'minitest'

module VariableArithmetic
  def self.run
    vars = {}
    while line = gets&.chomp
      type, data = parse(line)

      case type
      when :assignment
        vars[data.first] = data.last
      when :addition
        return if data == [0]
        puts encode(data, vars).join(" + ")
      end
    end
  end

  def self.encode(data, vars)
    sum = 0
    unknown = data.select do |l|
      !if l.class != String
        sum += l
      elsif vars[l]
        sum += vars[l]
      end
    end
    unknown.unshift(sum) if sum != 0 || unknown.empty?
    unknown
  end

  def self.parse(line)
    case line
    when /([a-z]+) = (\d+)/
      [:assignment, [$1, $2.to_i]]
    else
      [:addition, line.split(" + ").map{|n| if n =~ /^\d+$/ then n.to_i else n end}]
    end
  end
end

class VariableArithmeticTest < MiniTest::Test
  def test_parse_assignment
    assert_equal [:assignment, ["test", 4]], VariableArithmetic.parse("test = 4")
    assert_equal [:assignment, ["num", 4123]], VariableArithmetic.parse("num = 4123")
  end

  def test_parse_addition
    assert_equal [:addition, ["test"]], VariableArithmetic.parse("test")
    assert_equal [:addition, [5]], VariableArithmetic.parse("5")
    assert_equal [:addition, ["a", 5, "then", 9]], VariableArithmetic.parse("a + 5 + then + 9")
  end

  def test_encode
    # TODO
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  VariableArithmetic.run
end
