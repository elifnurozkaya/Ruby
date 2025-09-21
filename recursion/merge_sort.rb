def merge_arrays(arr1,arr2)
  i = 0
  j = 0
  merged_arr = []
  while i < arr1.length && j < arr2.length
    if arr1[i] <= arr2[j]
      merged_arr << arr1[i]
      i += 1
    elsif arr1[i] > arr2[j]
      merged_arr << arr2[j]
      j += 1
    end
  end
  if i < arr1.length 
    merged_arr << arr1[i..-1]
  elsif j < arr2.length 
    merged_arr << arr2[j..-1]
  end

  merged_arr.flatten
end




def merge_sort(array)
  if array.length <= 1
    return array
  end

  if array.length % 2 == 0
    middle = array.length / 2
  else
    middle = (array.length + 1) / 2
  end

  left_array = array[0..middle-1]
  right_array = array[middle..-1]

  left_array = merge_sort(left_array)
  right_array = merge_sort(right_array)

  array = merge_arrays(left_array,right_array)
  return array

end

arr = [3,12,25,1,0,27,13,2]

puts merge_sort(arr)