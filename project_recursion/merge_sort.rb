def merge_sort(array, sorted_array = [])
  n = array.length
  if array.length <= 2
    sorted_array << array
    return
  else
    merge_sort(array.values_at(1..n))
    merge_sort(array.values_at(n+1..array.length+1))
  end
  p sorted_array
end

arr = [5,3,2,6,1,4]

merge_sort(arr)