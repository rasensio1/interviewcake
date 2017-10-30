class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def kth_to_last_node(k, node)
  storage = []
  curr = node

  while curr do
    storage << curr
    storage = storage.last(k)
    curr = curr.next
  end

  storage.first
end

def kth_to_last_node_stick(k, node)
  stick_end = node
  stick_start = node

  (k-1).times do
    stick_end = stick_end.next
  end

  while stick_end.next do
    stick_start = stick_start.next
    stick_end = stick_end.next
  end

  stick_start
end

a = LinkedListNode.new("Angel Food")
b = LinkedListNode.new("Bundt")
c = LinkedListNode.new("Cheese")
d = LinkedListNode.new("Devil's Food")
e = LinkedListNode.new("Eccles")

a.next = b
b.next = c
c.next = d
d.next = e

puts "should be Devils food"
puts kth_to_last_node(2, a).value

puts "should be Bundt"
puts kth_to_last_node(4, a).value
puts "\n\n"

puts "should be Devils food"
puts kth_to_last_node_stick(2, a).value

puts "should be Bundt"
puts kth_to_last_node_stick(4, a).value

