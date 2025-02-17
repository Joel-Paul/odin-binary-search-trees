
class Tree
  def initialize(array=nil)
    @root = nil
  end

  def build_tree(array)
  end

  def insert(data)
  end

  def delete(data)
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
  
  attr_accessor :data
  
  def <=>(other)
    @data <=> other.data
  end

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

