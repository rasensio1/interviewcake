class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

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
    if @left
      @left.insert(num)
    else
      @left = BinaryTreeNode.new(num)
    end
  end

  def insert_right(num)
    if @right
      @right.insert(num)
    else
      @right = BinaryTreeNode.new(num)
    end
  end

  # Iterative Solution (DFS)
  # also doesn't go through the entire tree if it doesn't have to
  # 
  def superbalanced?
    depths = []
    nodes = [[self, 0]]

    until nodes.empty? do
      curr = nodes.pop
        nodes << [curr[0].left, curr[1] + 1] if curr[0].left
        nodes << [curr[0].right, curr[1] + 1] if curr[0].right
        depth = curr[1] if !curr[0].left && !curr[0].right
        if depth 
          if depths.uniq.size > 2 || depths.size == 2 && (depths[0] - depths[1]).abs > 1
            return false
          else
            depths << depth
            depths.uniq!
          end
        end
    end
    true
  end

  # Iterative Solution (BFS)
  #
  # def superbalanced?
  #   depths = []
  #   nodes = [[self, 0]]

  #   until nodes.empty? do
  #     les_go = nodes.dup

  #     les_go.each do |n|
  #       nodes.delete(n)

  #       nodes << [n[0].left, n[1] + 1] if n[0].left
  #       nodes << [n[0].right, n[1] + 1] if n[0].right
  #       depths << n[1] if !n[0].left && !n[0].right
  #     end
  #   end

  #   depths.max - depths.min < 2 ?  true : false
  # end

  # Recursive Solution
  #
  #
  # def superbalanced?
  #   nums = depth.flatten
  #   nums.max - nums.min < 2 ?  true : false
  # end

  # def depth
  #   !left && !right ? [1] : [depth_left, depth_right]
  # end

  # def depth_left
  #   @left ?  left.depth.flatten.map{|x| x + 1} : []
  # end

  # def depth_right
  #   @right ?  right.depth.flatten.map{|x| x + 1} : []
  # end

end


tree = BinaryTreeNode.new(10)

(1..20).to_a.shuffle.each { |n| tree.insert(n) }
puts "probably false"
puts tree.superbalanced?

bal = BinaryTreeNode.new(10)
[9, 11, 8, 12, 7, 13].each { |n| bal.insert(n)}
puts "should be true"
puts bal.superbalanced?
