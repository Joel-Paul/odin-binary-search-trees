
require_relative 'lib/bst'

# BST = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# BST.pretty_print

# BST.insert 0
# BST.pretty_print

# p BST.find(3)

# BST.delete 8
# BST.delete 4
# BST.delete 3
# BST.delete 1
# BST.delete 7
# BST.delete 5
# BST.delete 9
# BST.delete 67
# BST.delete 23
# BST.delete 6345
# BST.delete 324
# BST.pretty_print

# puts BST.level_order
# BST.level_order { |data| puts "Lucky number #{data}"}

# p BST.inorder
# BST.inorder { |data| puts "MY ORDER IS #{data}"}

# p BST.preorder
# BST.preorder { |data| puts "a number #{data}"}

# p BST.postorder
# BST.postorder { |data| puts "mega #{data}"}

# puts BST.height BST.find 67

# puts BST.depth BST.find 324

# puts BST.balanced?

# BST.delete 8
# BST.delete 4
# BST.delete 3
# BST.delete 1
# BST.delete 7
# BST.delete 5
# BST.delete 9
# BST.delete 67
# BST.delete 23
# BST.delete 6345
# BST.delete 324
# BST.pretty_print
# puts BST.balanced?

# BST.rebalance
# BST.pretty_print
# puts BST.balanced?

# Tie it all together
BST = Tree.new (Array.new(15) { rand(1..100) })
BST.pretty_print
puts BST.balanced?

p BST.level_order
p BST.preorder
p BST.postorder
p BST.inorder

for _ in 1..10
  BST.insert rand(100..200)
end
BST.pretty_print
puts BST.balanced?

BST.rebalance
BST.pretty_print
puts BST.balanced?

p BST.level_order
p BST.preorder
p BST.postorder
p BST.inorder