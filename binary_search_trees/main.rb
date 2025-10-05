require_relative 'lib/tree.rb'

data = [2,2,5,122,1,94,12,9,25,0]
tree = Tree.new(data)
tree.build_tree
tree.pretty_print