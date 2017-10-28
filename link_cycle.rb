class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end


def contains_cycle(node)
  fast_runner = node
  slow_runner = node
  result = nil

  while result.nil?
    fast_runner = fast_runner.next
    result = false if !fast_runner
    slow_runner = slow_runner.next

    fast_runner = fast_runner.next
    result = false if !fast_runner
    result = true if fast_runner == slow_runner
  end
  result
end

a = LinkedListNode.new(1)
b = LinkedListNode.new(2)
c = LinkedListNode.new(3)
d = LinkedListNode.new(4)
e = LinkedListNode.new(5)
f = LinkedListNode.new(6)
g = LinkedListNode.new(7)
h = LinkedListNode.new(8)
i = LinkedListNode.new(9)
j = LinkedListNode.new(10)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = g
g.next = h
h.next = i
i.next = j
j.next = g

puts "should be true"
puts contains_cycle(a)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = g
g.next = h
h.next = i
i.next = j
j.next = nil

puts "should be false"
puts contains_cycle(a)

