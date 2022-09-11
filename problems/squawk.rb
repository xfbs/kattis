#!/usr/bin/env ruby

require 'minitest'

module Squawk
  def self.run
    users, num_links, initial, time = gets.chomp.split.map(&:to_i)
    links = num_links.times.map{gets.chomp.split.map(&:to_i)}
    graph = graph(*links)
    infected = {initial => 1}
    time.times do
      infected = step(graph: graph, infected: infected)
    end

    puts infected.values.sum
  end

  # takes the edges (each a tuple [a, b] denoting a connection
  # between node a and b) and spits out a graph (a hash such that
  # hash[a] yields a list of all nodes that a is connected to).
  def self.graph(*edges)
    graph = Hash.new{|k, v| k[v] = []}
    edges.each do |a, b|
      graph[a] << b
      graph[b] << a
    end
    graph
  end

  # given a graph and a hash map of infected nodes such that hash[n] is the
  # number of squawks node n got, return a hash map of infected nodes and their
  # squawk counts after a minute.
  def self.step(graph:, infected:)
    infected.map{|node, amt| graph[node].map{|new| [new, amt]}.to_h}.inject({}) do |lhs, rhs|
      lhs.merge(rhs){|key, l, r| l + r}
    end
  end
end

class SquawkTest < MiniTest::Test
  def test_graph
    assert_equal({0 => [1], 1 => [0]}, Squawk.graph([1, 0]))
    assert_equal({0 => [1], 1 => [0]}, Squawk.graph([0, 1]))
    assert_equal({0 => [1, 3], 1 => [0, 2], 2 => [1, 3, 4], 3 => [0, 2], 4 => [2]}, 
                 Squawk.graph([0, 1], [1, 2], [3, 0], [3, 2], [2, 4]))
  end

  def test_step
    graph = Squawk.graph [0, 1], [0, 3], [1, 2], [2, 3], [2, 4]
    assert_equal({}, Squawk.step(graph: graph, infected: {5 => 1}))
    assert_equal({1 => 1, 3 => 1}, Squawk.step(graph: graph, infected: {0 => 1}))
    assert_equal({0 => 2, 2 => 2}, Squawk.step(graph: graph, infected: {1 => 1, 3 => 1}))
    assert_equal({1 => 4, 3 => 4, 4 => 2}, Squawk.step(graph: graph, infected: {0 => 2, 2 => 2}))
  end
end

if ARGV[0] == "test"
  MiniTest.autorun
else
  Squawk.run
end
