class Node 
  include Comparable
  attr_accessor :left , :right , :value
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  
end