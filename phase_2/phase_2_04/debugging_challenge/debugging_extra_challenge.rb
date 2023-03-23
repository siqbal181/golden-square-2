def max_sum_subarray(arr)
    max_sum = 0
    curr_sum = 0
    max_start_index = 0
    max_end_index = 0
    curr_start_index = 0
  
    arr.each_with_index do |val, index|
      if curr_sum + val > 0
        curr_sum += val
      else
        curr_start_index = index + 1
        curr_sum = 0
      end
  
      if curr_sum > max_sum
        max_sum = curr_sum
        max_start_index = curr_start_index
        max_end_index = index
      end
    end
  
    return arr[max_start_index..max_end_index]
  end
  
  # Intended output:
  #
  p max_sum_subarray([1, -2, 3, 10, -4, 7, 2, -5])
  # => [3, 10, -4, 7, 2]
  #
  # > max_sum_subarray([-1, -2, -3, -4])
  # => []
  