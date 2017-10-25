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

  #Iterative DFS solution
  def valid?
    stack = [[left, value, :left], [right, value, :right]]

    while !stack.empty? do
      curr = stack.pop
      node = curr[0]
      parent = curr[1]
      dir = curr[2]

      if node.left
        node.left.value < node.value ? true : (return false)
        if dir == :right
          node.left.value > parent ? true : (return false)
        end
        stack << [node.left, node.value, :left]
      end


      if node.right
        node.right.value > node.value ? true : (return false)
        if dir == :left
          node.right.value < parent ? true : (return false)
        end
        stack << [node.right, node.value, :right]
      end
    end
    true
  end
end


tree = BinaryTreeNode.new(10)
tree.left = BinaryTreeNode.new(8)
tree.left.left = BinaryTreeNode.new(9)
tree.right = BinaryTreeNode.new(11)
tree.right.left = BinaryTreeNode.new(13)


puts "should be false"
puts tree.valid?

val = BinaryTreeNode.new(10)
[9, 11, 8, 12, 7, 13].each { |n| val.insert(n)}
puts "should be true"
puts val.valid?
