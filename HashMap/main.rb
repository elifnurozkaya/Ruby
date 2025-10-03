require_relative 'lib/hash_map'

test = HashMap.new

 test.set('apple', 'red')
 test.set('banana', 'yellow')
 test.set('carrot', 'orange')
 test.set('dog', 'brown')
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')

#  puts test.get('apple')
#  test.set('apple','healthy')
#  puts test.get('apple')

#  puts test.has?("apple")
#  puts test.has?("floor")

#  puts test.get("apple")
#  puts test.remove("apple")
#  puts test.get("apple")

#  puts test.length

# test.clear(16)
# puts test.length

# puts test.keys

# puts test.values

# puts test.entries

puts test.capacity
puts test.length
test.set('moon', 'silver')
puts test.capacity
puts test.length