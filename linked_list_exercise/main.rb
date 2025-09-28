require_relative 'lib/linkedlist.rb'

list = LinkedList.new

list.append(3)
list.append(5)
list.append(12)
list.prepend(11)
#list.show_size
# list.to_s
# list.head
# list.tail
# list.at(-3)
# list.at(2)
# list.at(11)

# list.to_s
# list.pop
# list.to_s

# puts list.contains?(3)
# puts list.contains?(32)

list.find(12)
list.find(11)
list.find("e")