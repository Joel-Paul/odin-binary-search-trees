
require_relative 'lib/bst'

BST = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
BST.pretty_print
BST.insert 0
BST.pretty_print

