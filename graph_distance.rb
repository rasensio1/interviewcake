require 'set'

class GraphNode
  attr_accessor :label, :neighbors, :color, :potential_colors

  def initialize(label)
    @label = label
    @neighbors = Set.new
    @potential_colors = ["red", "blue", "yellow"]
    @color = nil
  end

end


def find_path(start_node, end_node, queue=[], tracked=Set.new)

  if start_node == end_node
    return start_node.label
  end

  queue << [start_node]
  tracked << start_node
  until queue.empty? do
    trace = queue.pop
    target = trace.last
    target.neighbors.each do |n|
      unless tracked.include?(n)
        queue.unshift(trace + [n])
        tracked << n
      end
      return (trace + [n]).map(&:label) if n == end_node
    end
  end
  return "No way to get there!"
end





#iterative solution

a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")
d = GraphNode.new("d")
e = GraphNode.new("e")
f = GraphNode.new("f")
g = GraphNode.new("g")
h = GraphNode.new("h")
i = GraphNode.new("i")

j = GraphNode.new("j")

a.neighbors << b
a.neighbors << c
a.neighbors << d

b.neighbors << a
b.neighbors << f
b.neighbors << i

c.neighbors << a
c.neighbors << d
c.neighbors << i
c.neighbors << g

d.neighbors << a
d.neighbors << c
d.neighbors << e

e.neighbors << d
e.neighbors << f

f.neighbors << g
f.neighbors << b
f.neighbors << e

g.neighbors << c
g.neighbors << h
g.neighbors << f

h.neighbors << i
h.neighbors << g

i.neighbors << g
i.neighbors << b
i.neighbors << h

graph = [a, b, c, d, e, f, g, h ,i]

puts "should be 'a'"
puts find_path(a, a)

puts "should be 'a b'"
puts find_path(a, b)

puts "should be 'a b f'"
puts find_path(a, f)

puts "should be 'a c g'"
puts find_path(a, g)

puts "either be 'a c g h' or 'a b i h'"
puts find_path(a, h)

puts "should be 'not possible!'"
puts find_path(a, j)

