require 'pry'
class BinaryTreeNode

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert(num)
    if num < value
      insert_left(num)
    else
      insert_right(num)
    end
  end

  def insert_left(num)
    @left ? @left.insert(num) : @left = BinaryTreeNode.new(num)
  end

  def insert_right(num)
    @right ?  @right.insert(num) : @right = BinaryTreeNode.new(num)
  end

  def second_largest
  end

  def largest_and_parent(tree=self)
    stack = [[tree, nil]]

    while !stack.empty? do
      curr, parent = stack.pop

      if !curr.right
        return [curr, parent]
      else
        stack << [curr.right, curr]
      end
    end
  end

  def second_largest
    biggest, parent = largest_and_parent

    if biggest.left
      return largest_and_parent(biggest.left).first.value
    else
      return parent.value
    end
  end

end




val = BinaryTreeNode.new(10)
[9, 11, 8, 12, 7, 13].each { |n| val.insert(n)}
puts "should be 12"
puts val.second_largest

new = BinaryTreeNode.new(10)
[8, 13, 7, 9, 12, 14].each { |n| new.insert(n) }
puts "should be 13"
puts new.second_largest

#largest is head
#
new = BinaryTreeNode.new(10)
[7, 6, 8, 9].each { |n| new.insert(n) }
puts "should be 9"
puts new.second_largest
