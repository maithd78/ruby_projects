def fibs(n)
  fibonacci = [0,1]
  if n <= 2
    p fibonacci
  else
    fibonacci << fibonacci[-2] + fibonacci[-1] until fibonacci.length == n
    p fibonacci
  end
end

fibs(8)

def fibs_rec(n, arr = [0, 1])
  if n <= 2 
    p arr
  else
    arr << arr[-1] + arr[-2]
    fibs_rec(n-1, arr)
  end
end

fibs_rec(8)