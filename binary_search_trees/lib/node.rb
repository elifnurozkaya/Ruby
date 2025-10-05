class Node 
  include Comparable

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <=>(name)
    @value <=> name.value
  end
end