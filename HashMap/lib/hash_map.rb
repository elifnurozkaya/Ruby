class HashMap
  attr_accessor :load_factor, :capacity

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(self.capacity)
  end

  def hash(key)
    hash_code = 0
    prime_num = 31

    key.each_char {|char| hash_code = hash_code *prime_num + char}

    return hash_code
  end

  def set(key,value)
    
  end

  def get(key)
    
  end
end