require_relative 'node.rb'
class HashMap
  attr_accessor :load_factor, :capacity

  def initialize(capacity = 16)
    @load_factor = 0.75
    @capacity = capacity
    @buckets = Array.new(self.capacity)
  end

  def hash(key)
    hash_code = 0
    prime_num = 31

    key.each_char {|char| hash_code = hash_code * prime_num + char.ord}

    return hash_code % @capacity
  end

  def set(key,value)
    hash_val = self.hash(key)

    if @buckets[hash_val] == nil
            @buckets[hash_val] = Node.new(key,value)
    else
      current = @buckets[hash_val]
      while current.next_node !=nil
        if current.key == key
          current.value = value
          return
        end
        current = current.next_node
      end
      if current.key == key
          current.value = value
          return
      end
      current.next_node = Node.new(key,value)
    end
  end

  def get(key)
    hash_value = self.hash(key)

    if @buckets[hash_value].key == key
      return @buckets[hash_value].value
    else
      current = @buckets[hash_value]
      while current.next_node !=nil
        if current.key == key
          return current.value
        end
        current = current.next_node
      end
      return nil
    end
  end
end