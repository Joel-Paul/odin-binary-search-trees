
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
    # 1. Find successor
    # 2. Swap
    # 3. Delete
  end

  def find(data)
  end

  def level_order
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def height
  end

  def depth
  end

  def balanced?
  end

  def rebalance
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
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
end

