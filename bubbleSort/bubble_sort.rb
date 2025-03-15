def bubble_sort(list)
  n = list.length - 1
  loop do
    swapped = false 
    for i in 1..n do
      if list[i-1] > list[i]
        list[i-1], list[i] = list[i], list[i-1]
        swapped = true
      end
    end
    if swapped == false
      break
    end
    n -= 1
  end
  p list
end

bubble_sort([4,3,78,2,0,2])
 # => [0,2,2,3,4,78]