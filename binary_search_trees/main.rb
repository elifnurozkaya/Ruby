require_relative 'lib/tree.rb'
require_relative 'lib/node.rb'

data = [2,2,5,122,1,94,12,9,25,0]
tree = Tree.new(data)
tree.build_tree

# tree.insert(11)
# tree.insert(9)
# tree.pretty_print
# tree.delete(9)


tree.pretty_print
tree.level_order{|node| puts node.value}