class Node 
  include Comparable

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  def <=>(name)
    @value <=> name.value
  end
end