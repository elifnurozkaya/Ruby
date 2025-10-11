require_relative 'lib/tree.rb'
require_relative 'lib/node.rb'

# data = [2,2,5,122,1,94,12,9,25,0]
# tree = Tree.new(data)
# tree.build_tree

# # tree.insert(11)
# # tree.insert(9)
# # tree.pretty_print
# # tree.delete(9)


# tree.pretty_print
# #tree.postorder{|node| print node.value}
# #puts tree.height(12)
# #puts tree.depth(122)

# puts tree.balanced?
# puts tree.rebalance

data = Array.new(15){rand(1..100)}
tree = Tree.new(data)
tree.build_tree
tree.pretty_print
puts "Is the tree balanced: #{tree.balanced?}"
puts "In-level order: #{tree.level_order}"

print "Preorder: " 
tree.preorder{|node| print "#{node.value} "}
puts ""

print "Inorder: " 
tree.inorder{|node| print "#{node.value} "}
puts ""

print "Postorder: " 
tree.postorder{|node| print "#{node.value} "}
puts ""

tree.insert(123)
tree.insert(125)
tree.insert(300)
tree.pretty_print
puts "Is the tree balanced: #{tree.balanced?}"
tree.rebalance
tree.pretty_print

puts "In-level order: #{tree.level_order}"

print "Preorder: " 
tree.preorder{|node| print "#{node.value} "}
puts ""

print "Inorder: " 
tree.inorder{|node| print "#{node.value} "}
puts ""

print "Postorder: " 
tree.postorder{|node| print "#{node.value} "}
puts ""
