require_relative 'node.rb'

class Tree
  def initialize(array)
    @data = array
    @root = nil
  end

  def build_tree(array= @data)
    cleaned_arr = []
    array.each do |val|
      cleaned_arr.push(val) unless cleaned_arr.include?(val)
    end
    @data = self.merge_sort(cleaned_arr)

    self.to_bst(@data)
  end

  def to_bst_recur(arr,left_i,right_i)
    return nil if left_i > right_i

    mid = left_i + (right_i -left_i)/2

    root = Node.new(arr[mid])

    root.left = to_bst_recur(arr,left_i,mid-1)
    root.right = to_bst_recur(arr,mid + 1,right_i)

    return root
  end

  def to_bst(arr)
    return nil if arr.empty?
    @root = to_bst_recur(arr,0,(arr.length-1))
  end


  

  def merge_arrays(arr1,arr2)
    merged = []
    i = 0
    j = 0

    while i < arr1.length && j < arr2.length
      if arr1[i] < arr2[j]
        merged.push(arr1[i])
        i += 1
      else
        merged.push(arr2[j])
        j += 1
      end
    end

    if i < arr1.length
      arr1[i..-1].each {|val| merged.push(val)}
    elsif j < arr2.length
      arr2[j..-1].each {|val| merged.push(val)}
    end

    return merged
  end

  def merge_sort(arr)
    if arr.length == 1
      return arr
    end

    left_arr = arr[0..((arr.length / 2) - 1)]
    right_arr = arr[(arr.length / 2)..-1]

    left_arr = merge_sort(left_arr)
    right_arr = merge_sort(right_arr)

    arr = self.merge_arrays(left_arr,right_arr)

    return arr
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


  def insert(node)
    return nil if @data.include?(node)

    parent_node = @root

    while parent_node.left || parent_node.right
      if node < parent_node.value
        parent_node = parent_node.left
      else
        parent_node = parent_node.right
      end 
    end

    if node < parent_node.value
      parent_node.left = Node.new(node)
    else
      parent_node.right = Node.new(node)
    end
  end

  def delete(num)
    if @data.include?(num) == false
      return nil
    end

    parent = nil
    node = @root
    until num == node.value
      if num < node.value
        parent = node
        node = node.left
      else
        parent = node
        node = node.right
      end
    end

    if node.right == nil && node.left == nil
      if parent.left == node
        parent.left = nil
        @data.delete(num)
        return
      else
        parent.right = nil
        @data.delete(num)
        return
      end
    end

    if node.left == nil
      if parent.left == node
        parent.left = node.right
        @data.delete(num)
        return
      else
        parent.right = node.right
        @data.delete(num)
        return
      end
    elsif node.right == nil
      if parent.left == node
        parent.left = node.left
        @data.delete(num)
        return
      else
        parent.right = node.left
        @data.delete(num)
        return
      end
    end

    replacement = node.right
    rep_parent = node

      until replacement.left == nil
        rep_parent = replacement
        replacement = replacement.left
      end
    
    rep_val = replacement.value
    node.value = rep_val
    
    if rep_parent.left == replacement
      rep_parent.left = replacement.right
    else
      rep_parent.right = replacement.right
    end

    
    @data.delete(num)
  end

  def find(val)
    node = @root

    while node.value != val
      if val < node.value
        node = node.left
      else
        node = node.right
      end
    end
    return node
  end

  def level_order(&block)
    return [] if @root.nil?

    unless block_given?
      result = []
      level_order{ |node| result << node.value}
      return result
    end

    queue = [@root]

    until queue.empty?
      current = queue.shift
      yield(current)

      queue << current.left if current.left
      queue << current.right if current.right
    end
  end

  def preorder(&block)
    return [] if @root.nil?

    unless block_given?
      result = []
      preorder{|node| result << node.value}
      return result
    end

    stack = [@root]

    until stack.empty?
      node = stack.pop
      yield(node)

      stack.push(node.right) if node.right
      stack.push(node.left) if node.left
    end

  end

  def inorder(&block)
    return [] if @root.nil?

    unless block_given?
      result = []
      preorder{|node| result << node.value}
      return result
    end

    stack = []
    current = @root

    while current || !stack.empty?
      while current
        stack.push(current)
        current = current.left
      end

      current = stack.pop
      yield current

      current = current.right
    end

  end

  def postorder(&block)
    return [] if @root.nil?

    unless block_given?
      result = []
      preorder{|node| result << node.value}
      return result
    end

    stack1 = [@root]
    stack2 = []

    until stack1.empty?
      node = stack1.pop
      stack2.push(node)

      stack1.push(node.left) if node.left
      stack1.push(node.right) if node.right
    end

    until stack2.empty?
      node = stack2.pop
      yield node
    end
  end

  def height(val)
    current = @root

    until current.value == val
      if val < current.value
        current = current.left
      else
        current = current.right
      end
    end

    if current == nil
      return nil
    end

    node = current

    queue = [node]
    height = -1

    until queue.empty?
      level_size = queue.size
      height += 1

      level_size.times do
        current = queue.shift
        
        queue.push(current.left) if current.left
        queue.push(current.right) if current.right
      end
    end
    return height
  end

  def depth(val)
    counter = 0
    current = @root

    until current.value == val
      if val < current.value 
        current = current.left
      else
        current = current.right
      end

      unless current
        return nil
      end
      counter += 1
    end
    
    return counter
  end

  def balanced?
    balanced_recursive(@root) != -1
  end

  def balanced_recursive(node)
    return 0 if node.nil?

    left_h = balanced_recursive(node.left)
    return -1 if left_h == -1

    right_h = balanced_recursive(node.right)
    return -1 if right_h == -1

    if (left_h - right_h).abs > 1
      return -1
    end

    return [left_h, right_h].max + 1
  end

  def rebalance
    unless self.balanced?
    @root = self.build_tree(inorder)
    end
    self
  end
end


