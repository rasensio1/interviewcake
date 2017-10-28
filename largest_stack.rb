class Stack

  def initialize
    @items = []
    @max = []
  end

# push a new item to the last index
  def push(item)
    @items.push(item)
    @max.push(item) if !@max.last || item > @max.last
  end

# remove the last item
  def pop()
    # if the stack is empty, return nil
    # (it would also be reasonable to throw an exception)
    if @items.empty?
      return nil
    end
      popped = @items.pop
      @max.pop if popped = @max.last
      return popped
  end

  def get_max
    @max.last
  end

# see what the last item is
  def peek()
    if @items.empty?
      return nil
    end
    return @items[-1]
  end
end


stacky = Stack.new
stacky.push(2)
stacky.push(5)
puts stacky.get_max
puts "should be 5"
stacky.push(7)
puts stacky.get_max
puts "should be 7"
stacky.pop
puts stacky.get_max
puts "should be 5"
stacky.push(3)
stacky.push(6)
stacky.push(1)
puts stacky.get_max
puts "should be 6"
