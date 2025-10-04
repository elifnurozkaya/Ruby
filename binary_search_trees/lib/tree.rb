class Tree
  def initialize(array)
    @data = array
    @root = nil
  end

  def build_tree(array)
    cleaned_arr = []
    array.each do |val|
      cleaned_arr.push(val) unless cleaned_arr.include?(val)
    end
    array = self.merge_sort(array)

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

  
end
