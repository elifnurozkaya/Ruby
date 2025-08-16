def bubble_sort(array)
  n = array.length
  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end
  puts array.inspect
end

bubble_sort([4,3,78,2,0,2])

