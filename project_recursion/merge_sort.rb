def merge_sort(array)
  if array.length <= 1
   return array
  else
    mid = array.length / 2
    left = merge_sort(array.slice(0,mid))
    right = merge_sort(array.slice(mid,array.length))
    merge(left,right)
  end
end

def merge(left,right)
  sorted = []
  until left.empty? || right.empty?
    if left.first < right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  p sorted + left + right
end

# arr = Array.new(8) { rand(1..9) }

arr = [2,4,6,5,1,3,8,7]

merge_sort(arr)