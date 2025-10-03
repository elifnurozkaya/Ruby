require_relative 'node.rb'
class HashMap
  attr_accessor :load_factor, :capacity, :length

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
    @length = 0
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
            @length += 1
    else
      current = @buckets[hash_val]
      while current.next_node !=nil
        if current.key == key
          current.value = value
          self.check
          return
        end
        current = current.next_node
      end
      if current.key == key
          current.value = value
          self.check
          return
      end
      
      current.next_node = Node.new(key,value)
      @length += 1
    end
    self.check
    
  end

  def check
    if @length > (@capacity * @load_factor)
      self.grow_capacity
    end
  end

  def grow_capacity
    backup = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity)
    @length = 0
    

    backup.each do |bucket|
      if bucket != nil
        current = bucket
        while current
          self.set(current.key,current.value)
          current = current.next_node
        end
      end
    end
    
  end

  def get(key)
    hash_value = self.hash(key)

    if @buckets[hash_value] == nil
      return nil
    end

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
    end
  end

  def has?(key)
    if get(key) != nil
      return true
    else
      return false
    end
  end

  def remove(key)
    hash_val = hash(key)

    prev = nil
    current = @buckets[hash_val]

    return nil if @buckets[hash_val].nil?

    if current.key == key && current.next_node == nil
      return_value = current.value
      @buckets[hash_val] = nil
      @length -= 1
      return return_value
    elsif current.key == key && current.next_node != nil
      return_value = current.value
      @buckets[hash_val] = current.next_node
      return return_value 
    elsif current.key != key && current.next_node != nil
      prev = current
      current = current.next_node
      while current 
        if current.key == key
          return_value = current.value
          prev.next_node = current.next_node
          return return_value
        end
        prev = current
        current = current.next_node
      end
      nil
    end
  end

def length
  i = 0
  current = @buckets[i]
  count = 0

  while i < @capacity
    if current == nil
      i += 1
     current = @buckets[i]
      next
    end
    count += 1
    while current.next_node
      count += 1
      current = current.next_node
    end
    i += 1
    current = @buckets[i]
  end
  return count
end

def clear(capacity)
  self.initialize(capacity)
end

def keys
  all_keys = []
  current = @buckets[0]
  i = 0
  while i < @capacity
    if current == nil
      i += 1
      current = @buckets[i]
      next
    end

    all_keys.push(current.key)
    while current
      current = current.next_node
      all_keys.push(current.key) if current != nil
    end
    i += 1
    current = @buckets[i]
  end
  return all_keys
end

def values
  all_values = []
  current = @buckets[0]
  i = 0
  while i < @capacity
    if current == nil
      i += 1
      current = @buckets[i]
      next
    end

    all_values.push(current.value)
    while current
      current = current.next_node
      all_values.push(current.value) if current != nil
    end
    i += 1
    current = @buckets[i]
  end
  return all_values
end

def entries
  keys = self.keys
  values = self.values

  entries = []
  i = 0
  while i < keys.length
    entries.push("[#{keys[i]},#{values[i]}]")
    i += 1
  end
  return entries
end
end