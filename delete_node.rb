class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end

end

def delete_node(node)
  self.value = self.next.value
  self.next = self.next.next
end

  a = LinkedListNode.new('A')
  b = LinkedListNode.new('B')
  c = LinkedListNode.new('C')

  a.next = b
  b.next = c


  delete_node(b)

