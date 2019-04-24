#!/usr/bin/env ruby

require 'minitest'

module ReverseRot
  def self.run
    while (line = gets.chomp) != "0"
      num, line = line.split
      puts encode(num.to_i, line)
    end
  end

  def self.encode(n, line)
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ_."
    reverse = alphabet.chars.each_with_index.to_h

    line
      .split("")
      .reverse
      .map{|c| reverse[c]}
      .map{|r| (r + n) % alphabet.size}
      .map{|c| alphabet[c]}
      .join
  end
end

class ReverseRotTest < MiniTest::Test
  def test_01
    assert_equal ReverseRot.encode(1, "ABCD"), "EDCB"
  end

  def test_02
    assert_equal ReverseRot.encode(3, "YO_THERE."), "CHUHKWBR."
  end

  def test_03
    assert_equal ReverseRot.encode(14, "ROAD"), "ROAD"
  end

  def test_04
    assert_equal ReverseRot.encode(9, "SHIFTING_AND_ROTATING_IS_NOT_ENCRYPTING"),
      "PWRAYF_LWNHAXWH.RHPWRAJAX_HMWJHPWRAORQ."
  end
end

if ARGV[0] == "test"
  MiniTest.run
else
  ReverseRot.run
end
