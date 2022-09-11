#!/usr/bin/env ruby

require 'minitest'

module BitByBit
  def self.run
    while (len = gets.to_i) != 0
      prog = len
        .times
        .map{|l| gets.chomp}
        .map{|l| parse(l)}
      puts exec(prog)
        .map{|f| eval(f)}
        .map{|e| if e then "1" elsif e.nil? then "?" else "0" end}
        .reverse
        .join
    end
  end

  def self.parse line
    case line
    when /CLEAR (\d+)/
      [:clear, $1.to_i]
    when /SET (\d+)/
      [:set, $1.to_i]
    when /AND (\d+) (\d+)/
      [:and, $1.to_i, $2.to_i]
    when /OR (\d+) (\d+)/
      [:or, $1.to_i, $2.to_i]
    end
  end

  def self.eval field
    case field
    when nil
      nil
    when true
      true
    when false
      false
    else
      lhs = eval field[1]
      rhs = eval field[2]
      case field.first
      when :and
        !(lhs == false || rhs == false) && (lhs && rhs || nil)
      when :or
        lhs || rhs || ((lhs.nil? || rhs.nil?) && nil)
      end
    end
  end

  def self.exec instrs
    register = (0..31).map{nil}

    instrs.each do |type, pos, dep|
      case type
      when :clear
        register[pos] = false
      when :set
        register[pos] = true
      when :and
        register[pos] = [:and, register[pos], register[dep]]
      when :or
        register[pos] = [:or, register[pos], register[dep]]
      end
    end

    register
  end
end

class BitByBitTest < MiniTest::Test
  def test_parse
    assert_equal [:set, 0], BitByBit.parse("SET 0")
    assert_equal [:clear, 0], BitByBit.parse("CLEAR 0")
    assert_equal [:or, 0, 1], BitByBit.parse("OR 0 1")
    assert_equal [:and, 0, 1], BitByBit.parse("AND 0 1")
  end

  def test_eval
    # nil, true, false evaluate to self
    assert_nil BitByBit.eval(nil)
    assert BitByBit.eval(true)
    assert BitByBit.eval(false) == false

    # only two trues are two
    assert BitByBit.eval([:and, true, true])

    # anything with false in it is false
    assert BitByBit.eval([:and, false, true]) == false
    assert BitByBit.eval([:and, true, false]) == false
    assert BitByBit.eval([:and, false, false]) == false
    assert BitByBit.eval([:and, false, nil]) == false
    assert BitByBit.eval([:and, nil, false]) == false

    # anything with nil in it is nil unless it's false
    assert_nil BitByBit.eval([:and, true, nil])
    assert_nil BitByBit.eval([:and, nil, true])
    assert_nil BitByBit.eval([:and, nil, nil])

    # anything with true in it is true
    assert BitByBit.eval([:or, true, true])
    assert BitByBit.eval([:or, true, false])
    assert BitByBit.eval([:or, false, true])
    assert BitByBit.eval([:or, true, nil])
    assert BitByBit.eval([:or, nil, true])

    # only two false are false
    assert BitByBit.eval([:or, false, false]) == false

    # anything with nil in it is nil unless it's true
    assert_nil BitByBit.eval([:or, nil, nil])
    assert_nil BitByBit.eval([:or, nil, false])
    assert_nil BitByBit.eval([:or, false, nil])

    # compound statements
    assert BitByBit.eval([:and, [:or, true, nil], [:or, [:and, nil, true], true]])
  end

  def test_exec
    assert_equal [true, false, [:and, nil, nil]],
      BitByBit.exec([[:set, 0], [:clear, 1], [:and, 2, 2]])[0..2]
    assert_equal [[:or, [:and, false, true], true], [:and, true, nil], true],
      BitByBit.exec([[:set, 31], [:set, 30], [:clear, 29], [:and, 29, 30], [:or, 29, 30], [:and, 30, 28]])[-3..-1]
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  BitByBit.run
end
