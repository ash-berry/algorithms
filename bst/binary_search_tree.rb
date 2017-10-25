class BinarySearchTree
  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(value)
      @val = value
      @left, @right = nil, nil
    end

    def insert(value)
      case @val <=> value
      when 1
        @left ? @left.insert(value) : @left = TreeNode.new(value)
      when -1
        @right ? @right.insert(value) : @right = TreeNode.new(value)
      when 0 then false
      end
    end
  end

  attr_reader :root, :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(key)
    @root.nil? ? @root = TreeNode.new(key) : @root.insert(key)
    @size += 1
  end

  def in_order_traverse(node=@root, &block)
    return if node.nil?
    in_order_traverse(node.left, &block)
    yield node
    in_order_traverse(node.right, &block)
  end

  def bst_array
    queue = [@root]
    bst_arr = []

    until queue.empty?
      current = queue.shift
      bst_arr << current

      if current
        if current.left.nil?
          queue << nil
        else
          unless bst_arr.include?(current.left)
            queue << current.left
          end
        end

        if current.right.nil?
          queue << nil
        else
          unless bst_arr.include?(current.right)
            queue << current.right
          end
        end
      end
    end
    reduce(bst_arr)
  end

  def delete_node(root, value)
    if root.nil?
      return root
    elsif value < root.val
      root.left = delete_node(root.left, value)
    elsif value > root.val
      root.right = delete_node(root.right, value)
    else
      if root.left.nil? && root.right.nil?
        root = nil
      elsif root.left.nil?
        root = root.right
      elsif root.right.nil?
        root = root.left
      else
        temp = find_min(root.right)

        root.val = temp.val
        root.right = delete_node(root.right, temp.val)
      end
    end
    root
  end

  def find_min(root)
    if root.left
      find_min(root.left)
    end
  end

  def find_max(root)
    if root.right
      find_max(root.right)
    end
  end

  private
  def reduce(bst_arr)
    bst_arr.pop until bst_arr[-1]

    bst_arr
  end
end
