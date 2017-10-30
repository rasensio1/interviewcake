class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def reverse_list(head)
  return "no list!" if !head

  curr = head
  prev = nil

  while true do 
    my_next = curr.next
    curr.next = prev
    break curr if !my_next
    prev = curr
    curr = my_next
  end
end


a = LinkedListNode.new(10)
b = LinkedListNode.new(9)
c = LinkedListNode.new(8)
d = LinkedListNode.new(7)

a.next = b
b.next = c
c.next = d

reversed = reverse_list(a)

puts "should be 7"
puts reversed.value

puts "should be 8"
puts reversed.next.value

puts "should be 10"
puts reversed.next.next.next.value

puts "should be none"
puts reverse_list(nil)

puts "one element, returns itself (5)"
puts reverse_list(LinkedListNode.new(5)).value

