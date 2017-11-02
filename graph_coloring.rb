require 'set'
require 'pry'

class GraphNode
  attr_accessor :label, :neighbors, :color, :potential_colors

  def initialize(label)
    @label = label
    @neighbors = Set.new
    @potential_colors = ["red", "blue", "yellow"]
    @color = nil
  end

  def set_color
    @color = @potential_colors.sample
    @potential_colors = nil

    my_neighbors(->(node) { node.potential_colors.delete(@color) })
    my_neighbors(->(node) { node.set_color})
  end

  def my_neighbors(method)
    @neighbors.each do |node|
      unless node.color
        method.call(node)
      end
    end
  end

end

a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")

a.neighbors << b
b.neighbors << a

b.neighbors << c
c.neighbors << b

c.neighbors << a
a.neighbors << c

graph = [a, b, c]

a.set_color

puts graph.map { |n| n.color}
