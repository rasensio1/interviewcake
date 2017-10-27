class Queue
  def initialize
    @s1 = []
    @s2 = []
  end

  def enqueue(val)
    @s1.push(val)
  end

  def to_s2
    until @s1.empty?
      @s2.push(@s1.pop)
    end
  end
  
  def dequeue
    if @s2.empty?
      to_s2
      @s2.pop
    else
      @s2.pop
    end
  end
end


# Only using Rub's "push", "pop", "first" and "empty?" to simulate a stack
#
# Max cost *per item* is this:
#   enqueue (push)
#   moved to out stack (pop 1, push 2)
#   (pop) out stack
#     -> O(1) runtime

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)

puts "should be 1: #{q.dequeue}"

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.dequeue
q.enqueue(3)
q.dequeue
q.enqueue(4)

puts "should be 3: #{q.dequeue}"
