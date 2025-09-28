require_relative 'nodes.rb'

class LinkedList

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      current = current.next_node until current.next_node == nil
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    prenode = Node.new(value)
    prenode.next_node = @head
    @head = prenode
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    return count
  end

  def show_size
    puts "Size of the list is #{self.size}"
  end

  def head
    puts "Head is #{@head.value}"
  end

  def tail
    tail = @head
    while tail.next_node
      tail = tail.next_node
    end
    puts "Tail is #{tail.value}"
  end

  def at(index)
    if index < 0
      puts "I don't know how to do that"
      return
    elsif index > (self.size-1)
      puts "Your list ain't that big!"
      return

    end
    tmp = @head
    while index > 0
      tmp = tmp.next_node
      index -= 1
    end
    puts tmp.value
  end

  def pop
    tmp = @head
    while tmp.next_node.next_node
      tmp = tmp.next_node
    end
    tmp.next_node = nil
  end

  def contains?(value)
    tmp = @head
    while tmp
      if tmp.value == value
        return true
      end
      tmp = tmp.next_node
    end
    false
  end

  def find(value)
    tmp = @head
    counter = 0
    while tmp
      if tmp.value ==value
        puts "That values index is #{counter}"
        return
      end
      counter += 1
      tmp = tmp.next_node
    end
    puts "Nope, I couldn't find it"
  end

  def to_s
    allnodes = []
    current = @head
    while current
      allnodes.push(current.value)
      current = current.next_node
    end

    puts allnodes.join(" -> ") + " -> nil"
    
  end

  def insert_at(value,index)
    
  end

  def remove_at(index)
    
  end
end