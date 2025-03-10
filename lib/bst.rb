
class Tree
  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.nil? or array.empty?

    mid = array.length / 2
    root = Node.new array[mid]

    root.left = build_tree array.slice(...mid)
    root.right = build_tree array.slice((mid + 1)..)
    root
  end

  def insert(data)
    node = @root
    while true
      case data <=> node.data
      when -1
        node.left = Node.new data unless node.left
        node = node.left
      when 0
        return
      when 1
        node.right = Node.new data unless node.right
        node = node.right
      end
    end
  end

  def delete(data)
    node = find data
    parent = find_parent data

    case node.children
    when 0, 1
      child = node.first_child
      if node == @root
        @root = child
      else
        parent.left = child if parent.left == node
        parent.right = child if parent.right == node
      end
    when 2
      successor = find_successor data
      successor_parent = find_parent successor.data
      successor_parent.left = successor.right
      node.data = successor.data  # Copy the successor data and delete it
    end
  end

  def find(data)
    node = @root
    until node.nil?
      case data <=> node.data
      when -1
        node = node.left
      when 0
        return node
      when 1
        node = node.right
      end
    end
    nil
  end

  def level_order
    q = [@root]
    order = []
    until q.empty?
      node = q.pop
      if block_given?
        yield node.data
      else
        order << node.data
      end
      q.prepend node.left if node.left
      q.prepend node.right if node.right
    end
    order
  end

  def inorder(node = @root, order = [], &block)
    return if node.nil?

    inorder(node.left, order, &block)
    if block_given?
      block.call node.data
    else
      order << node.data
    end
    inorder(node.right, order, &block)
    order
  end

  def preorder(node = @root, order = [], &block)
    return if node.nil?

    if block_given?
      block.call node.data
    else
      order << node.data
    end
    preorder(node.left, order, &block)
    preorder(node.right, order, &block)
    order
  end

  def postorder(node = @root, order = [], &block)
    return if node.nil?

    postorder(node.left, order, &block)
    postorder(node.right, order, &block)
    if block_given?
      block.call node.data
    else
      order << node.data
    end
    order
  end

  def height(node = @root)
    return -1 if node.nil?
    return 0 if node.leaf?
    left = node.left ? height(node.left) : 0
    right = node.right ? height(node.right) : 0
    [left, right].max + 1
  end

  def depth(node)
    current = @root
    depth = 0
    until current.nil?
      case node.data <=> current.data
      when -1
        current = current.left
      when 0
        return depth
      when 1
        current = current.right
      end
      depth += 1
    end
    nil
  end

  def balanced?(node = @root)
    return true if node.nil?

    left = height node.left
    right = height node.right

    (left - right).abs <= 1 and balanced?(node.left) and balanced?(node.right)
  end

  def rebalance
    @root = build_tree inorder
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def find_parent(data)
    parent = @root

    if parent.nil? or parent.data == data
      return nil
    end

    until parent.nil? or 
        (parent.left and parent.left.data == data) or
        (parent.right and parent.right.data == data)
      case data <=> parent.data
      when -1
        parent = parent.left
      when 0
        return nil
      when 1
        parent = parent.right
      end
    end
    parent
  end

  def find_successor(data)
    successor = (find data).right
    until successor.nil? or successor.left.nil?
      successor = successor.left
    end
    successor
  end
 
end


class Node
  include Comparable
  
  attr_accessor :data, :left, :right
  
  def <=>(other)
    @data <=> other.data
  end

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def children
    (@left.nil? ? 0 : 1) + (@right.nil? ? 0 : 1)
  end

  def first_child
    @left.nil? ? @right : @left
  end

  def leaf?
    first_child.nil?
  end
end

